// Copyright 2024 Fikret Şengül. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:deps/packages/injectable.dart';

import '../../../storage/storages/i_storage.dart';
import '../../models/o_auth2_token.model.dart';
import '../../others/failures/network_errors.dart';
import 'interceptors/dio_token_refresh_interceptor.dart';

/// `DioTokenRefresh` configures and provides a `TokenRefreshInterceptor` for OAuth2 tokens.
/// This class is responsible for initializing the interceptor with a token refresh logic
/// and a method to build the token headers.
@lazySingleton
class DioTokenRefresh {
  /// Constructs `DioTokenRefresh` with the given token storage.
  /// Initializes the `TokenRefreshInterceptor` with specific behaviors for token refresh.
  DioTokenRefresh(this._storage) {
    interceptor = DioTokenRefreshInterceptor<OAuth2Token>(
      tokenStorage: _storage,
      refreshToken: (token, _) async {
        if (token == null) {
          throw UnexpectedTokenRefreshNetworkError();
        }

        // TODO -> Implement the actual token refresh logic.
        // This should include making a network request to refresh the token
        // and returning the new token.

        return token;
      },
      tokenHeader: (token) {
        // Builds the authorization header using the token.
        return {'authorization': '${token.tokenType} ${token.accessToken}'};
      },
    );
  }

  /// The configured `TokenRefreshInterceptor` instance for use with a Dio client.
  late final DioTokenRefreshInterceptor<OAuth2Token> interceptor;

  final IStorage<OAuth2Token> _storage;
}