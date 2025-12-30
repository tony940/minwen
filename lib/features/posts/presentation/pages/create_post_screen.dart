import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/utils/my_toast.dart';
import 'package:minwen/core/widgets/app_loading_dialog.dart';
import 'package:minwen/features/posts/presentation/cubit/create_post_cubit.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: BlocListener<CreatePostCubit, CreatePostState>(
            listener: (context, state) {
              if (state is CreatePostLoadingState) {
                AppLoadingDialog.show(context, message: 'Publishing...');
              } else if (state is CreatePostSuccessState) {
                MyToast.success(context, 'Post created successfully');
                AppLoadingDialog.hide(context);
              } else if (state is CreatePostFailureState) {
                MyToast.error(context, 'Failed to create post');
                AppLoadingDialog.hide(context);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserHeader(),
                SizedBox(height: 25.h),
                _buildInputArea(),
                SizedBox(height: 20.h),
                // Enhanced Unified Media Selector
                _buildUnifiedMediaCard(),
                SizedBox(height: 40.h),
                _buildPremiumPublishButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserHeader() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(2.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFC59849), width: 1),
          ),
          child: CircleAvatar(
            radius: 22.r,
            backgroundColor: const Color(0xFF1B4332).withOpacity(0.1),
            child: Icon(Icons.person_rounded,
                color: const Color(0xFF1B4332), size: 26.sp),
          ),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أحمد العتيبي',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: const Color(0xFF1B4332),
              ),
            ),
            Text(
              'ينشر في العامة',
              style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: TextField(
        controller: _controller,
        maxLines: 6,
        style: TextStyle(fontSize: 16.sp, height: 1.5),
        decoration: InputDecoration(
          hintText: 'ما الذي تبحث عنه؟',
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildUnifiedMediaCard() {
    return GestureDetector(
      onTap: () {
        // Logic to pick Image or Video
      },
      child: Container(
        width: double.infinity,
        height: 140.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              const Color(0xFFF1F3F2), // Very light grey-green
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1B4332).withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            // 1. Decorative "Glass" shapes in the background
            Positioned(
              right: -20,
              top: -20,
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: const Color(0xFFC59849).withOpacity(0.05),
              ),
            ),

            // 2. Main Content Layout
            Padding(
              padding: EdgeInsets.all(20.r),
              child: Row(
                children: [
                  // Icon Branding with "Glass" effect
                  Container(
                    height: 80.r,
                    width: 80.r,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B4332).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.auto_awesome_motion_rounded,
                        color: const Color(0xFFC59849),
                        size: 32.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),

                  // Text Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'معرض الوسائط',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF1B4332),
                            letterSpacing: -0.5,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'أضف صور عالية الجودة أو مقاطع فيديو لتنشيط منشورك',
                          style: TextStyle(
                            fontSize: 11.sp,
                            height: 1.4,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Add button
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                          )
                        ]),
                    child: Icon(Icons.add_rounded,
                        color: const Color(0xFF1B4332), size: 20.sp),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumPublishButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1B4332), Color(0xFF2D6A4F)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1B4332).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          context.read<CreatePostCubit>().createPost();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'نشر المحتوى',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
                color: const Color(0xFFC59849),
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(width: 12.w),
            Icon(Icons.auto_awesome,
                color: const Color(0xFFC59849), size: 18.sp),
          ],
        ),
      ),
    );
  }
}
