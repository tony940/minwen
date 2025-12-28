import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrophyHeader extends StatelessWidget {
  const TrophyHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120.h,
      backgroundColor: const Color(0xFF1B4332),
      automaticallyImplyLeading: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.r)),
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MinWan',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.white)),
                Text('جمع النقاط',
                    style: TextStyle(fontSize: 10.sp, color: Colors.white70)),
              ],
            ),
            CircleAvatar(
              radius: 18.r,
              backgroundColor: Colors.white24,
              child:
                  Icon(Icons.person_outline, color: Colors.white, size: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
