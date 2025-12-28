import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/utils/spacing.dart';

class CreatePostCard extends StatelessWidget {
  final String userName;
  const CreatePostCard({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1B4332).withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildAvatar(),
              horizontalSpace(12),
              Expanded(
                child: Text(
                  'ماذا تبحث عنه اليوم يا $userName؟',
                  style: TextStyle(color: Colors.grey[400], fontSize: 13.sp),
                ),
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMiniAction(Icons.image_rounded, "صورة", Colors.green),
              horizontalSpace(12),
              _buildMiniAction(Icons.videocam_rounded, "فيديو", Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF1B4332).withOpacity(0.1)),
      ),
      child: CircleAvatar(
        radius: 18.r,
        backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=4'),
      ),
    );
  }

  Widget _buildMiniAction(IconData icon, String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16.sp),
          horizontalSpace(6),
          Text(label,
              style: TextStyle(
                  fontSize: 11.sp, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
