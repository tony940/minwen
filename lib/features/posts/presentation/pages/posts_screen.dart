import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/shared/cubit/main_scaffold_cubit.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/utils/spacing.dart';
import 'package:minwen/features/posts/presentation/widgets/create_post_card.dart';
import 'package:minwen/features/posts/presentation/widgets/post_card.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFA), // Clean professional background
      body: Stack(
        children: [
          // 1. Main Feed Content
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Slimmer Header Spacer
              SliverToBoxAdapter(child: verticalSpace(90.h)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: GestureDetector(
                    onTap: () =>
                        context.read<MainScaffoldCubit>().changeIndex(2),
                    child: const CreatePostCard(userName: "Mohamed"),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: verticalSpace(12.h)),

              // 3. Post Feed List
              SliverPadding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 80.h),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: PostCard(index: index),
                    ),
                    childCount: 10,
                  ),
                ),
              ),
            ],
          ),

          // 4. Compact Floating Header
          _buildFloatingHeader(context, AppColors.primaryColor),
        ],
      ),
    );
  }

  // --- Slim Header UI ---

  Widget _buildFloatingHeader(BuildContext context, Color brandColor) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 95.h,
        padding: EdgeInsets.fromLTRB(16.w, 45.h, 16.w, 5.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFA).withOpacity(0.9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Community',
                  style: TextStyle(
                    fontSize: 22.sp, // Reduced from 26
                    fontWeight: FontWeight.w800,
                    color: brandColor,
                    letterSpacing: -0.5,
                  ),
                ),
                Container(
                  height: 2.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC59849),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            _buildHeaderCircleAction(Icons.lightbulb_outline_rounded, context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCircleAction(IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () => _showHintDialog(context),
      child: Container(
        height: 36.h,
        width: 36.h,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[100]!),
        ),
        child: Icon(icon, color: const Color(0xFFC59849), size: 18.sp),
      ),
    );
  }

  // --- Compact Interaction Components ---

  void _showHintDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Hint',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) => const SizedBox(),
      transitionBuilder: (context, anim1, anim2, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
          child: ScaleTransition(
            scale: CurvedAnimation(parent: anim1, curve: Curves.easeOutBack),
            child: AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Smart Tip',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1B4332),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Posts with images or videos earn 50% more points!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13.sp, color: Colors.grey[600], height: 1.5),
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: double.infinity,
                    height: 44.h,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B4332),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r)),
                      ),
                      child: Text('Got it',
                          style: TextStyle(
                              color: const Color(0xFFC59849),
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
