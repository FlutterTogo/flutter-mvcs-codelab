import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../views/estimates_vew.dart';
import '../views/login_view.dart';
import '../views/register_view.dart';
import '../views/submint_estimate_view.dart';

enum AppRoutes {
  login('/login'),
  register('/register'),
  home('/home'),
  submitRequest('/submit');

  const AppRoutes(this.path);

  final String path;
}

Page errorPage(BuildContext context, GoRouterState state) {
  return CupertinoPage<Widget>(
    child: const Scaffold(),
    key: state.pageKey,
  );
}

class AppRouter {
  AppRouter(this.ref);

  final Ref ref;

  GoRouter get router {
    return GoRouter(
      initialLocation: AppRoutes.login.path,
      errorPageBuilder: errorPage,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: AppRoutes.login.path,
          name: AppRoutes.login.name,
          pageBuilder: (context, state) => CupertinoPage<LoginView>(
            child: const LoginView(),
            key: state.pageKey,
            restorationId: state.pageKey.value,
          ),
        ),
        GoRoute(
          path: AppRoutes.register.path,
          name: AppRoutes.register.name,
          pageBuilder: (context, state) => CupertinoPage<RegisterView>(
            child: const RegisterView(),
            key: state.pageKey,
            restorationId: state.pageKey.value,
          ),
        ),
        GoRoute(
          path: AppRoutes.home.path,
          name: AppRoutes.home.name,
          pageBuilder: (context, state) => CupertinoPage<Widget>(
            child: const EstimatesView(),
            key: state.pageKey,
            restorationId: state.pageKey.value,
          ),
        ),
        GoRoute(
          path: AppRoutes.submitRequest.path,
          name: AppRoutes.submitRequest.name,
          pageBuilder: (context, state) => CupertinoPage<Widget>(
            child: const SubmitEstimateView(),
            key: state.pageKey,
            restorationId: state.pageKey.value,
          ),
        ),
      ]
    );
  }
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return AppRouter(ref).router;
});
