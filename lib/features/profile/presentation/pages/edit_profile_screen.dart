import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/utils/spacing.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Unfocus logic when tapping anywhere outside
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SafeArea(
            child: Column(
              children: [
                verticalSpace(16),
                _buildProfileImagePicker(),
                verticalSpace(32),
                const _EditProfileForm(),
                verticalSpace(32),
                _buildSaveButton(context),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_rounded,
            color: Colors.black87, size: 18.sp),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Edit Profile',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp, // Slimmer title
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildProfileImagePicker() {
    return Center(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: AppColors.primaryColor.withOpacity(0.1), width: 1.5),
            ),
            child: CircleAvatar(
              radius: 50.r, // Slimmer avatar
              backgroundColor: Colors.grey[200],
              backgroundImage:
                  const NetworkImage('https://i.pravatar.cc/150?u=24'),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Icon(Icons.camera_alt_rounded,
                  color: Colors.white, size: 14.sp),
            ),
          ),
        ],
      ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h, // Professional standard height
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          elevation: 0, // Flat design for slim look
        ),
        child: Text(
          'Save Changes',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
      ),
    ).animate().fadeIn(delay: 300.ms);
  }
}

class _EditProfileForm extends StatelessWidget {
  const _EditProfileForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField(
            label: 'Full Name',
            hint: 'Mohamed Ahmed',
            icon: Icons.person_outline_rounded),
        verticalSpace(16),
        _buildTextField(
            label: 'Email Address',
            hint: 'mohamed.ahmed@example.com',
            isEnabled: false,
            icon: Icons.email_outlined),
        verticalSpace(16),
        _buildTextField(
            label: 'Phone Number',
            hint: '+1 234 567 890',
            isEnabled: false,
            icon: Icons.phone_android_rounded),
        verticalSpace(16),
        _buildTextField(
            label: 'Location',
            hint: 'New York, USA',
            icon: Icons.location_on_outlined),
      ],
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildTextField(
      {required String label,
      required String hint,
      required IconData icon,
      bool isEnabled = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, bottom: 6.h),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600]),
          ),
        ),
        TextField(
          enabled: isEnabled,
          style: TextStyle(fontSize: 13.sp),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13.sp),
            prefixIcon: Icon(icon, color: AppColors.primaryColor, size: 18.sp),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            filled: true,
            fillColor: isEnabled ? Colors.white : Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey[200]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey[200]!),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey[50]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
