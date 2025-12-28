import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.height,
    this.width,
    this.child,
  });

  final String buttonText;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final Widget? child;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1.0, // Shrinks when touched
        duration: 100.ms,
        child: Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 56.h,
          decoration: BoxDecoration(
            // Modern High-Contrast Gradient
            gradient: const LinearGradient(
              colors: [Colors.white, Color(0xFFE0E0E0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              // Soft Ambient Shadow
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
              // Subtle Glow Shadow
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: widget.child ??
              Text(
                widget.buttonText,
                style: TextStyle(
                  color: const Color(
                      0xFF1A1A2E), // Deep navy text for white button
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
        ),
      ),
    );
  }
}
