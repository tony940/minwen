import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/utils/spacing.dart';

class PrivacyAndSecurityScreen extends StatelessWidget {
  const PrivacyAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSecurityHeader(),
            verticalSpace(30),

            // Account Protection Section
            _buildSectionTitle('Account Security'),
            _buildSecurityCard([
              _SecurityTile(
                icon: Icons.lock_outline_rounded,
                title: 'Change Password',
                subtitle: 'Update your password regularly to stay safe',
                color: Colors.blue,
                onTap: () {},
              ),
              _buildDivider(),
              _SecurityTile(
                icon: Icons.delete_sweep_outlined,
                title: 'Delete My Account',
                subtitle: 'Delete your account permanently',
                color: Colors.redAccent,
                onTap: () {},
              ),
            ]),

            verticalSpace(24),

            // Policies and Legal Section
            _buildSectionTitle('Legal & Policies'),
            _buildSecurityCard([
              _SecurityTile(
                icon: Icons.description_outlined,
                title: 'Terms of Use',
                subtitle: 'Our rules and agreements for using the app',
                color: Colors.blueGrey,
                onTap: () {},
              ),
              _buildDivider(),
              _SecurityTile(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                subtitle: 'How we protect and manage your personal data',
                color: Colors.indigo,
                onTap: () {},
              ),
              _buildDivider(),
              _SecurityTile(
                icon: Icons.cookie_outlined,
                title: 'Cookie Policy',
                subtitle: 'Information about how we use cookies',
                color: Colors.brown,
                onTap: () {},
              ),
            ]),

            verticalSpace(40),

            // App Version
            Center(
              child: Text(
                'App Version 1.0.0',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 10.sp,
                ),
              ),
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.white,
      leading: IconButton(
        icon:
            const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Privacy & Security',
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w900,
            fontSize: 18.sp),
      ),
      centerTitle: true,
    );
  }

  Widget _buildSecurityHeader() {
    return Container(
      padding: EdgeInsets.all(20.r),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.8)
          ],
        ),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 8)),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.shield_rounded, color: Colors.white, size: 50.sp),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your account is secure',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold)),
                Text(
                    'Review your security settings to ensure your personal data is protected.',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 11.sp,
                        height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn().slideY(begin: 0.1, end: 0);
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, bottom: 12.h),
      child: Text(title,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w900,
              color: Colors.black54)),
    );
  }

  Widget _buildSecurityCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 15,
              offset: const Offset(0, 5))
        ],
      ),
      child: Column(children: children),
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildDivider() {
    return Divider(indent: 70.w, endIndent: 20.w, thickness: 0.5, height: 1);
  }
}

class _SecurityTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _SecurityTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      leading: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15.r)),
        child: Icon(icon, color: color, size: 22.sp),
      ),
      title: Text(title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle,
          style: TextStyle(fontSize: 10.sp, color: Colors.grey[500])),
      trailing: Icon(Icons.arrow_forward_ios_rounded,
          size: 14.sp, color: Colors.grey[400]),
      onTap: onTap,
    );
  }
}
