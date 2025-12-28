import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/features/profile/presentation/widgets/profile_stats_row.dart';
import '../widgets/profile_hero.dart';
import '../widgets/level_dashboard.dart';
import '../widgets/settings_group.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 25.h),
              const ProfileHero(),
              SizedBox(height: 25.h),
              const LevelDashboard(),
              SizedBox(height: 25.h),
              const StatsRow(),
              SizedBox(height: 30.h),
              const SettingsGroup(),
              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),
    );
  }
}
