import 'package:flutter_advanced_boilerplate/features/app/models/auth_model.dart';
import 'package:flutter_advanced_boilerplate/modules/dependency_injection/di.config.dart';
import 'package:fresh_graphql/fresh_graphql.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  ignoreUnregisteredTypes: [TokenStorage<AuthModel>],
)
Future<GetIt> configureDependencyInjection() async => getIt.init();
