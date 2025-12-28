import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/utils/spacing.dart';

class TrophyScoreOverview extends StatelessWidget {
  final String points;
  final String rank;
  const TrophyScoreOverview(
      {super.key, required this.points, required this.rank});

  @override
  Widget build(BuildContext context) {
    const Color accentGold = Color(0xFFD4AF37);
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Current Balance',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                verticalSpace(4),
                Row(
                  children: [
                    Text(points,
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.w900)),
                    horizontalSpace(4),
                    Icon(Icons.stars_rounded, color: accentGold, size: 20.sp),
                  ],
                ),
              ],
            ),
          ),
        ),
        horizontalSpace(12),
        _buildRankStat(accentGold),
      ],
    );
  }

  Widget _buildRankStat(Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Icon(Icons.emoji_events, color: color, size: 24.sp),
          Text('Rank #$rank',
              style: TextStyle(
                  fontSize: 10.sp, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
