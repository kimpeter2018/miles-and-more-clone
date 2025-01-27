import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miles_and_more_clone/data_models/user/user_provider.dart';
import 'package:miles_and_more_clone/features/auth/screens/login_screen.dart';
import 'package:miles_and_more_clone/features/auth/screens/register_name_screen.dart';
import 'package:miles_and_more_clone/features/auth/screens/register_screen.dart';
import 'package:miles_and_more_clone/features/util_widgets/error_screen.dart';
import 'package:miles_and_more_clone/features/util_widgets/loading_screen.dart';
import 'package:miles_and_more_clone/root_layout.dart';
import 'features/auth/auth_repository.dart';
import 'features/home_screen.dart';
import 'features/welcome_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  final userState = ref.watch(userProvider);

  return GoRouter(
    initialLocation: LoadingScreen.routeName,
    redirect: (context, state) {
      if (authState.isLoading || userState.isLoading) {
        return LoadingScreen.routeName;
      }

      if (authState.hasError || userState.hasError) {
        return ErrorScreen.routeName;
      }
      if (authState.hasError) {
        return GoRouter.of(context).namedLocation(ErrorScreen.routeName,
            queryParameters: {'errorMessage': authState.error.toString()});
      }

      if (userState.hasError) {
        return GoRouter.of(context).namedLocation(ErrorScreen.routeName,
            queryParameters: {'errorMessage': userState.error.toString()});
      }
      final isAuthenticated = authState.value != null;
      final userLoaded = userState.value != null;

      final isInWelcomeFlow =
          state.matchedLocation == WelcomeScreen.routeName ||
              state.matchedLocation == LoginScreen.routeName ||
              state.matchedLocation == RegisterScreen.routeName ||
              state.matchedLocation == RegisterNameScreen.routeName;

      if (!isAuthenticated && !isInWelcomeFlow) {
        return WelcomeScreen.routeName;
      } else if (isAuthenticated && !userLoaded) {
        return LoadingScreen.routeName;
      } else if (isAuthenticated && userLoaded) {
        return '/';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: LoadingScreen.routeName,
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: ErrorScreen.routeName,
        builder: (context, state) => ErrorScreen(
          errorMessage: state.uri.queryParameters['errorMessage']!,
        ),
      ),
      GoRoute(
        path: WelcomeScreen.routeName,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: RegisterScreen.routeName,
        path: RegisterScreen.routeName,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        name: RegisterNameScreen.routeName,
        path: RegisterNameScreen.routeName,
        builder: (context, state) => RegisterNameScreen(
          enteredEmail: state.uri.queryParameters['email']!,
          enteredPassword: state.uri.queryParameters['password']!,
        ),
      ),
      GoRoute(
        path: RootLayout.routeName,
        builder: (context, state) => const RootLayout(),
        routes: [
          GoRoute(
            path: HomeScreen.routeName,
            builder: (context, state) => const HomeScreen(),
          ),
        ],
      ),
    ],
  );
});
