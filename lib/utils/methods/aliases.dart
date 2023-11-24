import 'package:flutter_advanced_boilerplate/features/app/models/env_model.dart';
import 'package:flutter_advanced_boilerplate/modules/dependency_injection/di.dart';
import 'package:flutter_advanced_boilerplate/utils/helpers/logging_helper.dart';
import 'package:flutter_advanced_boilerplate/utils/router.dart';
import 'package:flutter_advanced_boilerplate/utils/router.gr.dart';

final LoggingHelper logIt = getIt<LoggingHelper>();
final EnvModel env = getIt<EnvModel>();
final AppRouter appRouter = getIt<AppRouter>();
