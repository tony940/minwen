import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:minwen/core/routing/app_router.dart';
import 'package:minwen/core/shared/cubit/main_scaffold_cubit.dart';
import 'package:minwen/core/themes/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 10.h), // Slimmer padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r), // Reduced radius for slim look
          bottomRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            _buildProfileAvatar(context),
            SizedBox(width: 10.w),
            Expanded(child: _buildWelcomeSection()),
            _buildNotificationButton(context),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.05, end: 0);
  }

  Widget _buildWelcomeSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome, Mohamed 👋',
          style: TextStyle(
            fontSize: 12.sp, // Slightly bigger for readability but thin
            fontWeight: FontWeight.w700,
            color: Colors.black87,
            letterSpacing: -0.3,
          ),
        ),
        Text(
          'Where to find? Just ask.',
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey[500],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationButton(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRouter.notification),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: 32.h,
            width: 32.h,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[100]!, width: 1),
            ),
            child: Icon(
              Icons.notifications_none_rounded,
              color: Colors.black87,
              size: 20.sp,
            ),
          ),
          Positioned(
            top: 6.h,
            right: 6.w,
            child: Container(
              height: 7.h,
              width: 7.h,
              decoration: BoxDecoration(
                color: const Color(0xFFFF5252),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileAvatar(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<MainScaffoldCubit>().changeIndex(4),
      child: Container(
        padding: EdgeInsets.all(1.5.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: AppColors.primaryColor.withOpacity(0.1), width: 1),
        ),
        child: CircleAvatar(
          radius: 17.r, // Slimmer radius
          backgroundColor: Colors.grey[100],
          backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=24'),
        ),
      ),
    );
  }
}
