import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/utils/spacing.dart';
import 'package:minwen/features/posts/presentation/widgets/create_post_card.dart';
import 'package:minwen/features/posts/presentation/widgets/post_card.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F3), // لون خلفية سينمائي بارد
      body: Stack(
        children: [
          // 1. المحتوى الأساسي تحت الـ Header
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                  child: verticalSpace(110.h)), // مساحة للـ Floating Header

              // 2. قسم "ماذا يدور في ذهنك" بتصميم زجاجي
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const CreatePostCard(userName: "محمد"),
                ),
              ),
              SliverToBoxAdapter(child: verticalSpace(16)),
              // 4. قائمة المنشورات
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
          // 5. الـ Floating Modern Header (يبقى ثابتاً في الأعلى بلمسة شفافة)
          _buildFloatingHeader(AppColors.primaryColor),
        ],
      ),
    );
  }

  Widget _buildFloatingHeader(Color brandColor) {
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
              const Color(0xFFF0F4F3).withOpacity(0.9),
              const Color(0xFFF0F4F3).withOpacity(0),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    color: const Color(0xFFC59849),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            _buildHeaderCircleAction(Icons.help_outline_outlined),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCircleAction(IconData icon) {
    return Container(
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Icon(icon, color: Colors.black87, size: 22.sp),
    );
  }
}
