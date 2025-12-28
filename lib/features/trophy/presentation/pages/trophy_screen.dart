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
      // استخدام تدرج لوني خفيف جداً في الخلفية بدلاً من لون واحد ثابت
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF0F4F2), // تدرج مائل للأخضر البارد جداً
            ],
          ),
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 100.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // العنوان الجانبي المودرن
                    _buildSectionTitle("إحصائياتك"),
                    verticalSpace(16),

                    // 2. ملخص النقاط بتصميم "Glassmorphism"
                    const TrophyScoreOverview(points: "1,800", rank: "12"),
                    verticalSpace(24),

                    // 3. كارت التقدم بتصميم "Neumorphic" خفيف
                    const TrophyProgressCard(
                        progress: 0.7, daysLeft: 7, pointsNeeded: 400),
                    verticalSpace(32),

                    // قسم النشاطات مع لمسة جمالية
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSectionTitle("النشاطات الأخيرة"),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "رؤية الكل",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: primaryDark.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(12),

                    // 4. قائمة الأنشطة
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
            fontSize: 18.sp,
            fontWeight: FontWeight.w900,
            color: const Color(0xFF1B4332),
            letterSpacing: -0.5,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.h),
          height: 3.h,
          width: 24.w,
          decoration: BoxDecoration(
            color: const Color(0xFFC59849), // لمسة ذهبية
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
