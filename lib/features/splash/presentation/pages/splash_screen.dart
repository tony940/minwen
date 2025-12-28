import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:minwen/core/routing/app_router.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/utils/spacing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Slightly longer delay to let the animation finish beautifully
    Future.delayed(const Duration(milliseconds: 3500), () {
      if (mounted) context.go(AppRouter.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // Match the Login Screen Gradient for a seamless transition
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              Color(0xFF1A1A2E), // Darker deep navy
              AppColors.secondaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background Decorative Circle (Modern touch)
            Positioned(
              top: -50.h,
              right: -50.w,
              child: Container(
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.03),
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 1.seconds)
                .scale(begin: const Offset(0, 0)),

            // The Main Logo
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'MinWan',
                  style: TextStyle(
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 5, // Modern wide tracking
                  ),
                )
                    .animate()
                    .fadeIn(duration: 800.ms)
                    .slideY(begin: 0.2, end: 0, curve: Curves.easeOutBack)
                    .shimmer(
                        delay: 1200.ms,
                        duration: 1800.ms,
                        color: Colors.white30),

                verticalSpace(10),

                // Subtitle/Tagline
                Text(
                  'YOUR JOURNEY STARTS HERE',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.white60,
                    letterSpacing: 2,
                  ),
                )
                    .animate(delay: 1.seconds)
                    .fadeIn(duration: 800.ms)
                    .blurXY(begin: 10, end: 0),
              ],
            ),
            // Bottom Loading Indicator (Minimalist)
            Positioned(
              bottom: 60.h,
              child: SizedBox(
                width: 40.w,
                child: const LinearProgressIndicator(
                  backgroundColor: Colors.white10,
                  color: Colors.white,
                  minHeight: 2,
                ),
              ).animate(delay: 500.ms).fadeIn(),
            ),
          ],
        ),
      ),
    );
  }
}
