import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:minwen/core/routing/app_router.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/themes/app_text_styles.dart';
import 'package:minwen/core/utils/spacing.dart';
import 'package:minwen/core/widgets/app_button.dart';
import 'package:minwen/features/auth/login/presentation/widgets/login_animated_logo.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // Controllers for the 4 OTP fields
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

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
                        verticalSpace(60),
                        const LoginAnimatedLogo(),
                        verticalSpace(40),
                        Expanded(child: _buildGlassContainer(context)),
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

  Widget _buildGlassContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          _buildHeaderText(),
          verticalSpace(40),
          // OTP Input Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) => _buildOtpField(index)),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),

          verticalSpace(30),
          _buildResendSection(),

          verticalSpace(40),
          AppButton(
            buttonText: 'Verify',
            onPressed: () {
              // Combine codes: _controllers.map((e) => e.text).join()
              context.pushReplacement(AppRouter.regiserationSuccess);
            },
          ).animate().fadeIn(delay: 400.ms).moveY(begin: 10),

          const Spacer(),
        ],
      ),
    ).animate().slideY(begin: 0.1, duration: 600.ms);
  }

  Widget _buildHeaderText() {
    return Column(
      children: [
        Text(
          'OTP VERIFICATION',
          style: TextStyle(
            color: const Color(0xFFC59849), // Goldish color from your image
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        verticalSpace(16),
        Text(
          'WE ARE SENDING YOU AN OTP TO VERIFY YOUR EMAIL',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white70,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600),
        ),
        verticalSpace(8),
        Text(
          'jassimtal23@gmail.com',
          style: TextStyle(color: const Color(0xFFC59849), fontSize: 14.sp),
        ),
      ],
    ).animate().fadeIn();
  }

  Widget _buildOtpField(int index) {
    return Container(
      width: 60.w,
      height: 60.w,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white24),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        onChanged: (value) {
          if (value.length == 1 && index < 3) {
            _focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
        style: TextStyle(
            color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildResendSection() {
    return Column(
      children: [
        const Text(
          "didn't receive code!",
          style: TextStyle(color: Colors.white60),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'resend code',
            style: TextStyle(
              color: Colors.redAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
