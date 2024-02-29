import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_boilerplate/features/app/app.dart';
import 'package:flutter_advanced_boilerplate/i18n/strings.g.dart';
import 'package:flutter_advanced_boilerplate/modules/bloc_observer/observer.dart';
import 'package:flutter_advanced_boilerplate/modules/dependency_injection/di.dart';
import 'package:flutter_advanced_boilerplate/modules/sentry/sentry_module.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      // Preserve splash screen until authentication complete.
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      // Use device locale.
      LocaleSettings.useDeviceLocale();

      // Removes leading # from the url running on web.
      setPathUrlStrategy();

      // Configures dependency injection to init modules and singletons.
      await configureDependencyInjection();

      if (UniversalPlatform.isAndroid) {
        // Increases android devices preferred refresh rate to its maximum.
        await FlutterDisplayMode.setHighRefreshRate();
      }

      if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
        // Sets up allowed device orientations and other settings for the app.
        await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
        );
      }

      // Sets system overylay style.
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [
          SystemUiOverlay.top,
          SystemUiOverlay.bottom,
        ],
      );

      // This setting smoothes transition color for LinearGradient.
      // Paint.enableDithering = true;

      // Inits sentry for error tracking.
      await initializeSentry();

      // Set bloc observer and hydrated bloc storage.
      Bloc.observer = Observer();
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory:
            UniversalPlatform.isWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
      );

      return runApp(
        // Sentrie's performance tracing for AssetBundles.
        DefaultAssetBundle(
          bundle: SentryAssetBundle(),
          child: TranslationProvider(
            child: const App(),
          ),
        ),
      );
    },
    (exception, stackTrace) async {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    },
  );
}
