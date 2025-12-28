import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/themes/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    this.prefixIcon,
    this.maxLines,
    // Modern Defaults
    this.borderColor = Colors.white12, // Subtle white border
    this.fillColor = Colors.white10, // Low-opacity glass fill
  });

  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Color borderColor;
  final Color fillColor;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      maxLines: maxLines ?? 1,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      // Use white text for dark modern backgrounds
      style: TextStyle(color: Colors.white, fontSize: 14.sp),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white38, fontSize: 14.sp),
        filled: true,
        fillColor: fillColor, // Glass effect
        contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),

        // --- Modern Rounded & Translucent Borders ---
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1),
        ),

        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        // Make the icons look cohesive
        suffixIconColor: Colors.white60,
        prefixIconColor: Colors.white60,
      ),
    );
  }
}
