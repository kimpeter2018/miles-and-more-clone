import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/auth_repository.dart';

final routerProvider = Provider((ref) {
  return _routeConfig(redirect: (context, state) {
    final authState = ref.read(authStateProvider);
    if (authState.isLoading || authState.hasError) return null;

    final isAuthenticated = authState.valueOrNull != null;
    final isAuthenticating = state.matchedLocation == Routes.login;

    if (!isAuthenticated) {
      return Routes.login;
    }

    if (isAuthenticating) {
      return Routes.dashboard;
    }

    return null;
  });
});

GoRouter _routeConfig({GoRouterRedirect? redirect = null}) => GoRouter(
  redirect: redirect,
  routes: [

  ],
);