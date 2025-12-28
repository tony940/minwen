import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHero extends StatelessWidget {
  const ProfileHero({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual user image URL from your Cubit/Model
    const String profileImageUrl = 'https://i.pravatar.cc/122?u=soso';

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            // Outer Ring Border
            Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFC59849), // Gold Border
                  width: 2.w,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.network(
                  profileImageUrl,
                  height: 90.r,
                  width: 90.r,
                  fit: BoxFit.cover,
                  // Loading State
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return _buildPlaceholder();
                  },
                  // Error Fallback State
                  errorBuilder: (context, error, stackTrace) =>
                      _buildPlaceholder(),
                ),
              ),
            ),

            // Edit Button Overlay
            _buildEditBadge(),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          'أحمد العتيبي',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w900,
            color: const Color(0xFF1B4332),
          ),
        ),
        Text(
          '@ahmed_vip',
          style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
        ),
      ],
    );
  }

  // Fallback when image is missing or loading
  Widget _buildPlaceholder() {
    return Container(
      height: 90.r,
      width: 90.r,
      color: const Color(0xFF1B4332).withOpacity(0.1),
      child: Icon(
        Icons.person_rounded,
        size: 50.sp,
        color: const Color(0xFF1B4332),
      ),
    );
  }

  Widget _buildEditBadge() {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: const Color(0xFFC59849),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2.w), // Makes badge pop
      ),
      child: Icon(
        Icons.camera_alt_rounded,
        size: 14.sp,
        color: Colors.white,
      ),
    );
  }
}
