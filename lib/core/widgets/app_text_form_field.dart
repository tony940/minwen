import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/themes/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  const AppTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      // Modern: White text for the dark background
      style: TextStyle(
        fontSize: 12.sp,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        hintText: hintText,
        labelText: labelText,
        // Subtle hint colors
        hintStyle: TextStyle(color: Colors.white38, fontSize: 14.sp),
        labelStyle: TextStyle(color: Colors.white70, fontSize: 14.sp),

        // --- THE GLASS EFFECT ---
        filled: true,
        fillColor: Colors.white.withOpacity(0.08),

        prefixIcon: prefixIcon != null
            ? IconTheme(
                data: const IconThemeData(color: Colors.white70),
                child: prefixIcon!)
            : null,
        suffixIcon: suffixIcon != null
            ? IconTheme(
                data: const IconThemeData(color: Colors.white70),
                child: suffixIcon!)
            : null,

        // Normal State
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),

        // Selection State
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide:
              BorderSide(color: Colors.white.withOpacity(0.5), width: 1.5),
        ),

        // Error State (Modern red-pink)
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Color(0xFFFF5252), width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Color(0xFFFF5252), width: 1.5),
        ),

        // Error Text Style
        errorStyle: TextStyle(
          color: const Color(0xFFFF5252),
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
