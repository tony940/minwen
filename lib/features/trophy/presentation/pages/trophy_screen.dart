import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/utils/spacing.dart';
import 'package:minwen/features/trophy/presentation/widgets/trophy_activity_list.dart';
import 'package:minwen/features/trophy/presentation/widgets/trophy_header.dart';
import 'package:minwen/features/trophy/presentation/widgets/trophy_progress_card.dart';
import 'package:minwen/features/trophy/presentation/widgets/trophy_score_overview.dart';

class TrophyScreen extends StatelessWidget {
  const TrophyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryDark = Color(0xFF1B4332);

    return Scaffold(
      appBar: const TrophyHeader(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF8FAF9), // Even lighter slim gradient
            ],
          ),
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    16.w, 10.h, 16.w, 80.h), // Tightened horizontal padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Title
                    _buildSectionTitle("Your Statistics"),
                    verticalSpace(12),

                    // 1. Score Overview (Glassmorphism)
                    const TrophyScoreOverview(points: "1,800", rank: "12"),
                    verticalSpace(20),

                    // 2. Progress Card (Clean/Slim)
                    const TrophyProgressCard(
                        progress: 0.7, daysLeft: 7, pointsNeeded: 400),
                    verticalSpace(24),

                    // 3. Activity Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildSectionTitle("Recent Activity"),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: Text(
                              "See All",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: primaryDark.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(12),

                    // 4. Activity List
                    const TrophyActivityList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15.sp, // Reduced size for slim look
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1B4332),
            letterSpacing: -0.3,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 2.h),
          height: 2.h, // Thinner underline
          width: 16.w,
          decoration: BoxDecoration(
            color: const Color(0xFFC59849),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
