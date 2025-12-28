import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:minwen/core/routing/app_router.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/themes/app_text_styles.dart';
import 'package:minwen/core/utils/spacing.dart';
import 'package:minwen/core/widgets/app_button.dart';
import 'package:minwen/core/widgets/app_text_form_field.dart';
import 'package:minwen/features/auth/login/presentation/widgets/login_animated_logo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  // State for toggling password visibility
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  // State for agreement checkboxes
  bool isTermsAgreed = false;
  bool isPrivacyAgreed = false;

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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        // --- 1. TOP SECTION (LOGO) ---
                        verticalSpace(50),
                        const LoginAnimatedLogo(),
                        verticalSpace(40),

                        // --- 2. BOTTOM GLASS CONTAINER ---
                        Expanded(
                          child: _buildFormContainer(context),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFormContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Account',
              style: AppTextStyles.font20BlackBold.copyWith(
                color: Colors.white,
                fontSize: 28.sp,
              ),
            ).animate().fadeIn().slideX(begin: -0.1),

            verticalSpace(24),

            // Full Name Field
            AppTextFormField(
              hintText: 'Full Name',
              prefixIcon:
                  const Icon(Icons.person_outline, color: Colors.white70),
            ).animate().fadeIn(delay: 100.ms),

            verticalSpace(16),

            // Password Field
            AppTextFormField(
              hintText: 'Password',
              obscureText: isPasswordObscure,
              prefixIcon: const Icon(Icons.lock_outline, color: Colors.white70),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordObscure = !isPasswordObscure;
                  });
                },
                icon: Icon(
                  isPasswordObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.white70,
                  size: 20.sp,
                ),
              ),
            ).animate().fadeIn(delay: 200.ms),

            verticalSpace(16),

            // Confirm Password Field
            AppTextFormField(
              hintText: 'Confirm Password',
              obscureText: isConfirmPasswordObscure,
              prefixIcon:
                  const Icon(Icons.lock_reset_outlined, color: Colors.white70),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isConfirmPasswordObscure = !isConfirmPasswordObscure;
                  });
                },
                icon: Icon(
                  isConfirmPasswordObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.white70,
                  size: 20.sp,
                ),
              ),
            ).animate().fadeIn(delay: 300.ms),

            verticalSpace(20),

            // Terms Checkbox
            _buildCheckboxTile(
              value: isTermsAgreed,
              onChanged: (val) => setState(() => isTermsAgreed = val!),
              text: "By signing up I agree to Terms & Conditions",
            ).animate().fadeIn(delay: 400.ms),

            // Privacy Checkbox
            _buildCheckboxTile(
              value: isPrivacyAgreed,
              onChanged: (val) => setState(() => isPrivacyAgreed = val!),
              text: "By signing up I agree to Privacy Policy",
            ).animate().fadeIn(delay: 500.ms),

            verticalSpace(30),

            // Sign Up Button
            AppButton(
              height: 46.h,
              buttonText: 'Sign Up',
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   // Signup logic here
                // }
                context.push(AppRouter.otpScreen);
              },
            ).animate().fadeIn(delay: 600.ms).moveY(begin: 10),

            const Spacer(),

            verticalSpace(30),
            _buildLoginPrompt(context),
          ],
        ),
      ),
    ).animate().slideY(begin: 0.1, duration: 600.ms, curve: Curves.easeOut);
  }

  Widget _buildCheckboxTile({
    required bool value,
    required Function(bool?) onChanged,
    required String text,
  }) {
    return Row(
      children: [
        SizedBox(
          height: 24.w,
          width: 24.w,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            side: const BorderSide(color: Colors.white38),
            activeColor: Colors.white,
            checkColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: Colors.white70, fontSize: 13.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginPrompt(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => context.pop(),
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.white60, fontSize: 14.sp),
            children: [
              const TextSpan(text: "Already have an account? "),
              TextSpan(
                text: "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
