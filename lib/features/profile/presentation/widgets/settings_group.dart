import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:minwen/core/routing/app_router.dart';
import 'package:minwen/core/shared/cubit/main_scaffold_cubit.dart';

class SettingsGroup extends StatelessWidget {
  const SettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w, bottom: 12.h),
          child: Text(
            'General Settings',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w900, // Thicker font for modern look
              color: const Color(0xFF1B4332),
              letterSpacing: -0.5,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(28.r), // More rounded for modern feel
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: Column(
            children: [
              _SettingsTile(
                icon: Icons.person_outline_rounded,
                title: 'Edit Profile',
                color: Colors.blueAccent,
                onTap: () => context.push(AppRouter.editProfileScreen),
              ),
              const _CustomDivider(),
              _SettingsTile(
                icon: Icons.notifications_none_rounded,
                title: 'Notifications',
                color: Colors.orangeAccent,
                onTap: () => context.push(AppRouter.notification),
              ),
              const _CustomDivider(),
              _SettingsTile(
                icon: Icons.shield_outlined,
                title: 'Privacy & Security',
                color: Colors.teal,
                onTap: () => context.push(AppRouter.privacyAndSecurityScreen),
              ),
              const _CustomDivider(),
              _SettingsTile(
                icon: Icons.logout_rounded,
                title: 'Logout',
                color: Colors.redAccent,
                onTap: () {
                  context.go(AppRouter.splashScreen);
                  context.read<MainScaffoldCubit>().changeIndex(0);
                },
              ),
            ],
          ),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, end: 0),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
      leading: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(icon, color: color, size: 22.sp),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black.withOpacity(0.8),
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14.sp,
        color: Colors.grey[300],
      ),
      onTap: onTap,
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();
  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 65.w, // Aligns with the title text
      endIndent: 20.w,
      thickness: 0.6,
      height: 1,
      color: Colors.grey[100],
    );
  }
}
