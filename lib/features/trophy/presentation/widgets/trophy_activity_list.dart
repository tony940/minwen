import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/utils/spacing.dart';

class TrophyActivityList extends StatelessWidget {
  const TrophyActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات تجريبية (يمكن نقلها لموديل لاحقاً)
    final List<Map<String, dynamic>> activities = [
      {
        "title": "Community Helper",
        "subtitle": "Today at 12:30 PM",
        "points": "+300 pts",
        "icon": Icons.volunteer_activism,
        "color": Colors.blue,
      },
      {
        "title": "Correct Answer",
        "subtitle": "Yesterday at 08:45 PM",
        "points": "+500 pts",
        "icon": Icons.auto_awesome,
        "color": Colors.orange,
      },
      {
        "title": "Daily Streak",
        "subtitle": "2 days ago",
        "points": "+50 pts",
        "icon": Icons.history,
        "color": Colors.purple,
      },
    ];

    return Column(
      children: activities.map((item) {
        return ActivityListItem(
          title: item['title'],
          subtitle: item['subtitle'],
          points: item['points'],
          icon: item['icon'],
          iconColor: item['color'],
        );
      }).toList(),
    );
  }
}

class ActivityListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String points;
  final IconData icon;
  final Color iconColor;

  const ActivityListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.points,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        // إضافة ظل خفيف جداً لتمييز العناصر عن الخلفية
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // أيقونة النشاط بخلفية ملونة شفافة
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: iconColor, size: 20.sp),
          ),
          horizontalSpace(12),
          // النصوص (العنوان والتوقيت)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          // عدد النقاط المكتسبة
          Text(
            points,
            style: TextStyle(
              color: const Color(0xFF2D6A4F), // لون أخضر معبر عن الربح
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
