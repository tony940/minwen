import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/themes/app_text_styles.dart';

class LoginAnimatedLogo extends StatelessWidget {
  const LoginAnimatedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'MinWan??',
        style: AppTextStyles.font36WhiteBold.copyWith(
          letterSpacing: 4,
          fontStyle: FontStyle.italic,
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 800.ms)
        // Begin at 0.5 (half height) instead of 4 for a tighter, smoother move
        .slideY(
            begin: 0.5, end: 0, curve: Curves.easeOutCubic, duration: 800.ms)
        // Adds a modern subtle pulse/shimmer effect
        .shimmer(delay: 1000.ms, duration: 1500.ms, color: Colors.white24);
  }
}
