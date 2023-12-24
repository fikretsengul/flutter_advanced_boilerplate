import 'dart:async';

import 'package:deps/infrastructure/commons.dart';
import 'package:deps/infrastructure/networking.dart';
import 'package:deps/locator/locator.dart';
import 'package:deps/packages/auto_route.dart';

import '../routes/router.gm.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final completer = Completer<AuthStatus>();

    di<INetworkClient>().tokenStorage.authStatus.listen((status) {
      if (!completer.isCompleted && status != AuthStatus.initial) {
        completer.complete(status);
      }
    });

    completer.future.then((status) {
      if (status == AuthStatus.authenticated) {
        resolver.next();
      } else {
        resolver.redirect(LoginRoute(onResult: (didLogin) => resolver.next(didLogin)));
      }
    });
  }
}