import 'package:flutter_advanced_boilerplate/utils/methods/aliases.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@singleton
class LoggingHelper {
  final Logger logIt = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
    ),
  );

  /// Log a message at level [Level.verbose].
  void verbose(
    dynamic message, {
    dynamic error,
    bool showInProd = false,
    StackTrace? stackTrace,
  }) {
    if (env.isRelease && !showInProd) {
      return;
    }

    logIt.v(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug].
  void debug(
    dynamic message, {
    dynamic error,
    bool showInProd = false,
    StackTrace? stackTrace,
  }) {
    if (env.isRelease && !showInProd) {
      return;
    }

    logIt.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info].
  void info(
    dynamic message, {
    dynamic error,
    bool showInProd = false,
    StackTrace? stackTrace,
  }) {
    if (env.isRelease && !showInProd) {
      return;
    }

    logIt.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  void warn(
    dynamic message, {
    dynamic error,
    bool showInProd = false,
    StackTrace? stackTrace,
  }) {
    if (env.isRelease && !showInProd) {
      return;
    }

    logIt.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error].
  void error(
    dynamic message, {
    dynamic error,
    bool showInProd = false,
    StackTrace? stackTrace,
  }) {
    if (env.isRelease && !showInProd) {
      return;
    }

    logIt.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.wtf].
  void wtf(
    dynamic message, {
    dynamic error,
    bool showInProd = false,
    StackTrace? stackTrace,
  }) {
    if (env.isRelease && !showInProd) {
      return;
    }

    logIt.wtf(message, error: error, stackTrace: stackTrace);
  }
}
