import 'package:auto_route/auto_route.dart';
import 'package:flutter_advanced_boilerplate/utils/router.gr.dart';
import 'package:injectable/injectable.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: AppWrapper.page,
          initial: true,
          children: [
            AutoRoute(
              path: 'login',
              page: LoginScreen.page,
            ),
            AutoRoute(
              path: 'home',
              page: AppNavigator.page,
            ),
          ],
        ),
      ];
}
