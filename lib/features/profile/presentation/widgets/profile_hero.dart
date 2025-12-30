import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileHero extends StatelessWidget {
  const ProfileHero({super.key});

  @override
  Widget build(BuildContext context) {
    const String profileImageUrl = 'https://i.pravatar.cc/150?u=24';

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            // 1. Outer Glow/Halo Effect
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFC59849).withOpacity(0.2),
                    blurRadius: 25,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: _buildProfileImage(profileImageUrl),
            ),

            // 2. Modern Edit Badge
            _buildEnhancedEditBadge(),
          ],
        ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),

        SizedBox(height: 16.h),

        // 3. Name with improved Typography
        Text(
          'Ahmed Al-Otaibi',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w900,
            color: const Color(0xFF1B4332),
            letterSpacing: -0.5,
          ),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),

        // 4. Modern Bio/Handle
        Container(
          margin: EdgeInsets.only(top: 4.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            '@ahmed_vip',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
        ).animate().fadeIn(delay: 400.ms),
      ],
    );
  }

  Widget _buildProfileImage(String url) {
    return Container(
      padding: EdgeInsets.all(3.r),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFFC59849), Color(0xFFEBC17B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(2.r),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: 50.r,
          backgroundColor: Colors.grey[200],
          backgroundImage: NetworkImage(url),
        ),
      ),
    );
  }

  Widget _buildEnhancedEditBadge() {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: const Color(0xFF1B4332), // Using Brand Dark for contrast
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        Icons.camera_alt_rounded,
        size: 16.sp,
        color: Colors.white,
      ),
    )
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .shimmer(duration: 3000.ms);
  }
}
