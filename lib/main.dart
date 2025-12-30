import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/dependency_injection/dependency_injection.dart';
import 'package:minwen/core/routing/app_router.dart';
import 'package:minwen/core/shared/cubit/main_scaffold_cubit.dart';
import 'package:minwen/features/splash/presentation/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Dependency Injection
  setupGetIt();
  runApp(
    // 1. Wrap your App in DevicePreview
    DevicePreview(
      enabled: false, // Enable preview only in debug mode
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MainScaffoldCubit(),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            // 2. Add DevicePreview configurations to MaterialApp
            useInheritedMediaQuery:
                true, // Required for older versions of DevicePreview
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,

            routerConfig: AppRouter.router,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
