import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/utils/spacing.dart';

class CreatePostCard extends StatelessWidget {
  final String userName;
  const CreatePostCard({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r), // Slimmer radius
        border: Border.all(color: Colors.grey[100]!), // Surgical border
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildAvatar(),
              horizontalSpace(10),
              Expanded(
                child: Text(
                  'What are you looking for, $userName?',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // Optional: Small plus icon to indicate "Create"
              Icon(Icons.add_circle_outline_rounded,
                  color: Colors.grey[300], size: 18.sp),
            ],
          ),
          verticalSpace(12),
          const Divider(height: 1, thickness: 0.5, color: Color(0xFFF5F5F5)),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSlimAction(
                  Icons.image_outlined, "Photo", Colors.blueAccent),
              _buildSlimAction(
                  Icons.videocam_outlined, "Video", Colors.redAccent),
              _buildSlimAction(
                  Icons.location_on_outlined, "Location", Colors.teal),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 16.r, // Slimmer radius
      backgroundColor: Colors.grey[100],
      backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=4'),
    );
  }

  Widget _buildSlimAction(IconData icon, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color.withOpacity(0.8), size: 16.sp),
        horizontalSpace(6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
