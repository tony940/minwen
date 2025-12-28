import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:minwen/core/routing/app_router.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/themes/app_text_styles.dart';
import 'package:minwen/core/utils/my_toast.dart';
import 'package:minwen/core/utils/spacing.dart';
import 'package:minwen/core/widgets/app_button.dart';
import 'package:minwen/features/auth/login/presentation/cubits/cubit/login_cubit.dart';
import 'package:minwen/features/auth/login/presentation/widgets/login_animated_logo.dart';
import 'package:minwen/features/auth/login/presentation/widgets/login_form.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

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
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        // --- 1. TOP SECTION (LOGO) ---
                        verticalSpace(60),
                        const LoginAnimatedLogo(),
                        verticalSpace(60),

                        // --- 2. BOTTOM GLASS CONTAINER ---
                        // Expanded ensures this takes all remaining height
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
    final loginCubit = context.read<LoginCubit>();

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWelcomeText(),
          verticalSpace(32),
          const LoginForm().animate().fadeIn(delay: 200.ms),
          _buildForgotPassword(),
          verticalSpace(24),
          _buildLoginButtonConsumer(loginCubit),

          // Pushes the Sign-up prompt to the bottom of the glass container
          const Spacer(),

          verticalSpace(30),
          _buildSignUpPrompt(context),
        ],
      ),
    ).animate().slideY(
          begin: 0.1,
          end: 0,
          duration: 600.ms,
          curve: Curves.easeOut,
        );
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: AppTextStyles.font20BlackBold.copyWith(
            color: Colors.white,
            fontSize: 28.sp,
          ),
        ),
        verticalSpace(4),
        Text(
          'Log in to your account',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 14.sp,
            letterSpacing: 0.5,
          ),
        ),
      ],
    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.1);
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // TODO: Add Forgot Password Logic
        },
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.white70,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButtonConsumer(LoginCubit cubit) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          MyToast.error(context, state.errorMessage);
        } else if (state is LoginSuccessState) {
          context.pushReplacement('/mainScaffold');
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoadingState;
        return SizedBox(
          width: double.infinity,
          child: AppButton(
            height: 46.h, // Modern taller button
            buttonText: isLoading ? '' : 'Sign In',
            onPressed: isLoading ? () {} : () => _onLoginPressed(cubit),
            child: isLoading
                ? SizedBox(
                    height: 35.h,
                    child:
                        LottieBuilder.asset('assets/animations/loading.json'),
                  )
                : null,
          ),
        );
      },
    ).animate().fadeIn(delay: 400.ms).moveY(begin: 10);
  }

  void _onLoginPressed(LoginCubit cubit) {
    if (cubit.formKey.currentState!.validate()) {
      cubit.login();
    }
  }

  Widget _buildSignUpPrompt(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => context.push(AppRouter.signUp),
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.white60, fontSize: 14.sp),
            children: [
              const TextSpan(text: "New here? "),
              TextSpan(
                text: "Create an Account",
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
    ).animate().fadeIn(delay: 600.ms);
  }
}
