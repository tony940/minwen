import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/utils/spacing.dart';

class TrophyProgressCard extends StatelessWidget {
  final double progress;
  final int daysLeft;
  final int pointsNeeded;

  const TrophyProgressCard({
    super.key,
    required this.progress,
    required this.daysLeft,
    required this.pointsNeeded,
  });

  @override
  Widget build(BuildContext context) {
    const Color darkGreen = Color(0xFF1B4332);
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [darkGreen, darkGreen.withOpacity(0.8)]),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Next Reward",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Icon(Icons.info_outline, color: Colors.white70, size: 18),
            ],
          ),
          verticalSpace(20),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white12,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$pointsNeeded points to go",
                  style: TextStyle(color: Colors.white70, fontSize: 11.sp)),
              Text("$daysLeft Days left",
                  style: TextStyle(color: Colors.white, fontSize: 11.sp)),
            ],
          ),
        ],
      ),
    );
  }
}
