import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/utils/spacing.dart';
import 'package:minwen/core/widgets/app_text_form_field.dart';
import 'package:minwen/features/auth/login/presentation/cubits/cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

    return Form(
      key: loginCubit.formKey,
      child: Column(
        children: [
          // Email Field
          SizedBox(
            height: 50.h,
            child: AppTextFormField(
              controller:
                  loginCubit.emailController, // Ensure you have this in Cubit
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Please enter your email';
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value))
                  return 'Please enter a valid email';
                return null;
              },
              hintText: 'Email',
              // Applying Glassy Style if your AppTextFormField supports it
            )
                .animate()
                .fadeIn(duration: 400.ms, delay: 200.ms) // Reduced delay
                .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),
          ),

          verticalSpace(16), // Increased spacing for a cleaner look

          // Password Field
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return SizedBox(
                height: 50.h,
                child: AppTextFormField(
                  controller: loginCubit.passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter your password';
                    return null;
                  },
                  hintText: 'Password',
                  obscureText: loginCubit.isObsecure,
                  suffixIcon: IconButton(
                    onPressed: () => loginCubit.toggleObsecureText(),
                    icon: Icon(
                      loginCubit.isObsecure
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye_outlined,
                      size: 20.sp,
                      color: Colors.black45,
                    ),
                  ),
                ),
              );
            },
          )
              .animate()
              .fadeIn(
                  duration: 400.ms,
                  delay: 350.ms) // Staggered by 150ms after Email
              .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),
        ],
      ),
    );
  }
}
