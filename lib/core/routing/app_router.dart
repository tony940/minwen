import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:minwen/core/dependency_injection/dependency_injection.dart';
import 'package:minwen/features/auth/login/presentation/cubits/cubit/login_cubit.dart';
import 'package:minwen/features/auth/login/presentation/pages/login_screen.dart';
import 'package:minwen/features/auth/sign_up/presentation/pages/otp_screen.dart';
import 'package:minwen/features/auth/sign_up/presentation/pages/regiseration_success.dart';
import 'package:minwen/features/auth/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:minwen/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:minwen/features/notification/presentation/pages/notification_screen.dart';
import 'package:minwen/features/splash/presentation/pages/splash_screen.dart';
import 'package:minwen/main_scaffold.dart';

class AppRouter {
  static final String splashScreen = '/splashScreen';
  static final String login = '/loginScreen';
  static final String signUp = '/signUpScreen';
  static final String otpScreen = '/otpScreen';
  static final String regiserationSuccess = '/regiserationSuccess';
  static final String mainScaffold = '/mainScaffold';
  static final String notification = '/notification';
  static final GoRouter router = GoRouter(
    initialLocation: mainScaffold,
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: signUp,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: otpScreen,
        builder: (context, state) => OtpScreen(),
      ),
      GoRoute(
        path: regiserationSuccess,
        builder: (context, state) => RegiserationSuccess(),
      ),
      GoRoute(
        path: mainScaffold,
        builder: (context, state) => MainScaffold(),
      ),
      GoRoute(
        path: notification,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<NotificationCubit>()..getAllNotification(),
          child: NotificationScreen(),
        ),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
