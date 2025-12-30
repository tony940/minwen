import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:minwen/core/routing/app_router.dart';
import 'package:minwen/core/shared/cubit/main_scaffold_cubit.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:path/path.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            _buildProfileAvatar(context),
            SizedBox(width: 12.w),
            Expanded(child: _buildWelcomeSection()),
            // زر التنبيهات الجديد
            _buildNotificationButton(context),
            SizedBox(width: 8.w),

            _buildSmallAskButton(context),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.1, end: 0);
  }

  Widget _buildWelcomeSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome, mohamed 👋',
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        Text(
          'من وين اسال ؟ تلاقي ',
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey[500],
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.notification);
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: 30.h,
            width: 30.h,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[200]!, width: 0.5),
            ),
            child: Icon(
              Icons.notifications_none_rounded, // أيقونة ناعمة ومودرن
              color: Colors.black87,
              size: 22.sp,
            ),
          ),
          // النقطة الحمراء (الاشعار)
          Positioned(
            top: 8.h,
            right: 8.w,
            child: Container(
              height: 8.h,
              width: 8.h,
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

  Widget _buildSmallAskButton(BuildContext context) {
    // أضفنا الـ context هنا
    return GestureDetector(
      onTap: () {
        context.read<MainScaffoldCubit>().changeIndex(2);
      },
      child: Container(
        height: 38.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_circle_outline_rounded,
                  color: Colors.white, size: 16.sp),
              SizedBox(width: 6.w),
              Text(
                'اسأل',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileAvatar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<MainScaffoldCubit>().changeIndex(4);
      },
      child: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: AppColors.primaryColor.withOpacity(0.1), width: 1),
        ),
        child: CircleAvatar(
          radius: 18.r,
          backgroundColor: Colors.grey[100],
          backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=24'),
        ),
      ),
    );
  }
}
