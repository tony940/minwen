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
      backgroundColor: const Color(0xFFF0F4F3), // Cool cinematic background
      body: Stack(
        children: [
          // 1. Main Feed Content
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Spacer for the Floating Header
              SliverToBoxAdapter(child: verticalSpace(110.h)),

              // 2. "What's on your mind" Card
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to Create Post (Index 2 in your Cubit)
                      context.read<MainScaffoldCubit>().changeIndex(2);
                    },
                    child: const CreatePostCard(userName: "محمد"),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: verticalSpace(16.h)),

              // 3. Post Feed List
              SliverPadding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 100.h),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => PostCard(index: index),
                    childCount: 10,
                  ),
                ),
              ),
            ],
          ),

          // 4. Floating Modern Header
          _buildFloatingHeader(context, AppColors.primaryColor),
        ],
      ),
    );
  }

  // --- Header UI Components ---

  Widget _buildFloatingHeader(BuildContext context, Color brandColor) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 110.h,
        padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 10.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFF0F4F3),
              const Color(0xFFF0F4F3).withOpacity(0.95),
              const Color(0xFFF0F4F3).withOpacity(0),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'المجتمع',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w900,
                    color: brandColor,
                    letterSpacing: -1,
                  ),
                ),
                Container(
                  height: 3.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC59849), // Gold Accent
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            _buildHeaderCircleAction(Icons.help_outline_outlined, context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCircleAction(IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () => _showHintDialog(context),
      child: Container(
        height: 42.h,
        width: 42.h,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Icon(icon, color: const Color(0xFF1B4332), size: 22.sp),
      ),
    );
  }

  // --- Interaction Components ---

  void _showHintDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Hint',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) => const SizedBox(),
      transitionBuilder: (context, anim1, anim2, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 6 * anim1.value,
            sigmaY: 6 * anim1.value,
          ),
          child: FadeTransition(
            opacity: anim1,
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: anim1,
                curve: Curves.easeInOut, // Smooth "Pop" effect
              ),
              child: AlertDialog(
                backgroundColor: Colors.white.withOpacity(0.95),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Gold Icon Container
                    Container(
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC59849).withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.lightbulb_outline_rounded,
                        color: const Color(0xFFC59849),
                        size: 36.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'تلميحة ذكية',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF1B4332),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'المنشورات التي تحتوي على صور وفيديوهات تحصل على نقاط مضاعفة بنسبة 50%!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[800],
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 28.h),
                    // "Got it" Button
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B4332),
                        minimumSize: Size(double.infinity, 50.h),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: Text(
                        'فهمت ذلك',
                        style: TextStyle(
                          color: const Color(0xFFC59849), // Gold text on green
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
