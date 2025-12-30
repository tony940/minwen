import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/utils/spacing.dart';

class PostCard extends StatelessWidget {
  final int index;
  const PostCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r), // Slimmer radius
        border: Border.all(color: Colors.grey[100]!), // Surgical border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          verticalSpace(10),
          Text(
            'Looking for a shop that sells original Tesla screens in New Cairo. Any recommendations?',
            style: TextStyle(
              fontSize: 13.sp,
              height: 1.4,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          verticalSpace(12),
          _buildPostImage(),
          verticalSpace(12),
          _buildStats(),
          const Divider(height: 24, thickness: 0.5),
          _buildActions(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
            radius: 16.r, // Slimmer avatar
            backgroundColor: Colors.grey[100],
            backgroundImage:
                NetworkImage('https://i.pravatar.cc/150?u=$index')),
        horizontalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sarah Ahmed',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp)),
            Text('15 minutes ago',
                style: TextStyle(color: Colors.grey[500], fontSize: 9.sp)),
          ],
        ),
        const Spacer(),
        Icon(Icons.more_horiz_rounded, color: Colors.grey[400], size: 20.sp),
      ],
    );
  }

  Widget _buildPostImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r), // Slimmer radius
      child: Image.network(
        'https://picsum.photos/800/500?random=$index',
        height: 180.h,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        _stackAvatars(),
        horizontalSpace(6),
        Text('24 people helped',
            style: TextStyle(color: Colors.grey[500], fontSize: 10.sp)),
        const Spacer(),
        Text('8 replies',
            style: TextStyle(color: Colors.grey[500], fontSize: 10.sp)),
      ],
    );
  }

  Widget _stackAvatars() {
    return SizedBox(
      width: 40.w,
      height: 18.h,
      child: Stack(
        children: List.generate(
          3,
          (i) => Positioned(
            left: i * 10.0,
            child: CircleAvatar(
              radius: 9.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7.5.r,
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?u=${i + 10}'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _actionItem(
            Icons.volunteer_activism_outlined, "Help", const Color(0xFF1B4332)),
        _actionItem(
            Icons.chat_bubble_outline_rounded, "Reply", Colors.grey[600]!),
        _actionItem(Icons.share_outlined, "Share", Colors.grey[600]!),
      ],
    );
  }

  Widget _actionItem(IconData icon, String label, Color color) {
    return Row(
      children: [
        Icon(icon, color: color.withOpacity(0.8), size: 18.sp),
        horizontalSpace(6),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
