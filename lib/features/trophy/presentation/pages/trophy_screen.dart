import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/utils/spacing.dart';
import 'package:minwen/features/trophy/presentation/widgets/trophy_activity_list.dart';
import 'package:minwen/features/trophy/presentation/widgets/trophy_header.dart';
import 'package:minwen/features/trophy/presentation/widgets/trophy_progress_card.dart';
import 'package:minwen/features/trophy/presentation/widgets/trophy_score_overview.dart';
// قم باستيراد الملفات الأخرى هنا بعد فصلها

class TrophyScreen extends StatelessWidget {
  const TrophyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryDark = Color(0xFF1B4332);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          TrophyHeader(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. ملخص النقاط
                  TrophyScoreOverview(points: "1,800", rank: "12"),
                  verticalSpace(24),

                  // 3. كارت التقدم
                  TrophyProgressCard(
                      progress: 0.7, daysLeft: 7, pointsNeeded: 400),
                  verticalSpace(30),

                  Text(
                    'Recent Activity',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: primaryDark.withOpacity(0.8),
                    ),
                  ),
                  verticalSpace(16),

                  // 4. قائمة الأنشطة
                  TrophyActivityList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
