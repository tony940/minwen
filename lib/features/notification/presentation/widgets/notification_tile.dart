import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/utils/spacing.dart';

class NotificationTile extends StatelessWidget {
  final Map<String, dynamic> item;
  const NotificationTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    bool isRead = item['isRead'];
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildLeadingIcon(),
          horizontalSpace(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item['title'],
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 14.sp)),
                    Text(item['time'],
                        style: TextStyle(
                            color: Colors.grey[400], fontSize: 10.sp)),
                  ],
                ),
                verticalSpace(4),
                Text(
                  item['body'],
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 12.sp, height: 1.3),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (!isRead)
            Container(
              margin: EdgeInsets.only(left: 10.w),
              height: 8.h,
              width: 8.h,
              decoration: const BoxDecoration(
                  color: Color(0xFFC59849), shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }

  Widget _buildLeadingIcon() {
    IconData iconData =
        item['type'] == 'reply' ? Icons.message_rounded : Icons.star_rounded;
    Color iconColor = item['type'] == 'reply'
        ? const Color(0xFF1B4332)
        : const Color(0xFFC59849);

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Icon(iconData, color: iconColor, size: 20.sp),
    );
  }
}
