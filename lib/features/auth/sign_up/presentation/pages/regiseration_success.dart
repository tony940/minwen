import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:minwen/core/routing/app_router.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/utils/spacing.dart';
import 'package:minwen/core/widgets/app_button.dart';

class RegiserationSuccess extends StatelessWidget {
  const RegiserationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, Color(0xFF1A1A2E)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. Logo/Title
                Text(
                  'MinWan?',
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                )
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .slideY(begin: -0.2, end: 0),

                verticalSpace(60),

                // 2. Celebration Icon (Lottie or Image)
                // You can replace this with a Lottie animation for a more modern feel
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.celebration_rounded,
                    size: 100.sp,
                    color: const Color(0xFFC59849), // Gold accent
                  ),
                )
                    .animate()
                    .scale(duration: 600.ms, curve: Curves.elasticOut)
                    .shimmer(delay: 800.ms, duration: 1500.ms),

                verticalSpace(40),

                // 3. Success Message
                Text(
                  'verified successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFC59849),
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().fadeIn(delay: 400.ms),

                verticalSpace(16),

                Text(
                  'congratulations you have succesfully created\naccount in MinWAN???',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.sp,
                    height: 1.5,
                  ),
                ).animate().fadeIn(delay: 600.ms),

                verticalSpace(60),

                // 4. Action Button
                AppButton(
                  buttonText: 'GET STARTED',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GET STARTED',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      horizontalSpace(10),
                      const Icon(Icons.send_rounded, color: Colors.black),
                    ],
                  ),
                  onPressed: () {
                    context.go(AppRouter.mainScaffold);
                  },
                ).animate().fadeIn(delay: 800.ms).moveY(begin: 20, end: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
