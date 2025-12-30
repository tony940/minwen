import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelDashboard extends StatelessWidget {
  const LevelDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: const Color(0xFF1B4332), // Brand Dark Green
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
              color: const Color(0xFF1B4332).withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10))
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 15.h),
          _buildProgressBar(),
          SizedBox(height: 10.h),
          _buildFooter(),
        ],
      ),
    ).animate(onPlay: (controller) {
      controller.repeat(reverse: true);
    }).shimmer(duration: 10.seconds);
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CURRENT LEVEL',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 10.sp,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Platinum Expert',
              style: TextStyle(
                color: const Color(0xFFC59849), // Gold Accent
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Icon(
          Icons.workspace_premium_rounded,
          color: Color(0xFFC59849),
          size: 35,
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Stack(
      children: [
        // Progress Track
        Container(
          height: 8.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        // Active Progress
        FractionallySizedBox(
          widthFactor: 0.65,
          child: Container(
            height: 8.h,
            decoration: BoxDecoration(
              color: const Color(0xFFC59849),
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFC59849).withOpacity(0.5),
                  blurRadius: 10,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '650 / 1000 Points',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Level 12',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 11.sp,
          ),
        ),
      ],
    );
  }
}
