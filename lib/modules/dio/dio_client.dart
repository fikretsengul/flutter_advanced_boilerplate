import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_advanced_boilerplate/features/app/models/env_model.dart';
import 'package:flutter_advanced_boilerplate/modules/dio/interceptors/api_error_interceptor.dart';
import 'package:flutter_advanced_boilerplate/modules/dio/interceptors/bad_network_error_interceptor.dart';
import 'package:flutter_advanced_boilerplate/modules/dio/interceptors/internal_server_error_interceptor.dart';
import 'package:flutter_advanced_boilerplate/modules/dio/interceptors/unathenticated_interceptor.dart';
import 'package:flutter_advanced_boilerplate/modules/token_refresh/dio_token_refresh.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:universal_platform/universal_platform.dart';

Dio initDioClient(
  EnvModel env,
  DioTokenRefresh dioTokenRefresh,
) {
  final dio = Dio();

  if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
    /// Allows https requests for older devices.
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        // Don't trust any certificate just because their root cert is trusted.
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        // You can test the intermediate / root cert here. We just ignore it.
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return client;
      },
    );
  }

  dio.options.baseUrl = env.restApiUrl;
  dio.options.headers['Accept-Language'] =
      UniversalPlatform.isWeb ? 'en-US' : Platform.localeName.substring(0, 2);
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);
  dio.interceptors.add(dioTokenRefresh.fresh);
  dio.interceptors.add(BadNetworkErrorInterceptor());
  dio.interceptors.add(InternalServerErrorInterceptor());
  dio.interceptors.add(ApiErrorInterceptor());
  dio.interceptors.add(UnauthenticatedInterceptor());

  // Sentrie's performance tracing, http breadcrumbs and
  // automatic recording of bad http requests for dio.
  dio.addSentry();

  if (env.debugApiClient) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }

  return dio;
}
