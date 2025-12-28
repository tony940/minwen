import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsGroup extends StatelessWidget {
  const SettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5.w, bottom: 12.h),
          child: Text('الإعدادات العامة',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(24.r)),
          child: Column(
            children: [
              _SettingsTile(
                  icon: Icons.person_outline_rounded,
                  title: 'تعديل الملف الشخصي',
                  color: Colors.blue),
              _Divider(),
              _SettingsTile(
                  icon: Icons.notifications_none_rounded,
                  title: 'التنبيهات',
                  color: Colors.orange),
              _Divider(),
              _SettingsTile(
                  icon: Icons.shield_outlined,
                  title: 'الخصوصية والأمان',
                  color: Colors.green),
              _Divider(),
              _SettingsTile(
                  icon: Icons.logout_rounded,
                  title: 'تسجيل الخروج',
                  color: Colors.red),
              _Divider(),
              _SettingsTile(
                  icon: Icons.remove_circle_sharp,
                  title: 'حذف الحساب ',
                  color: Colors.redAccent),
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _SettingsTile(
      {required this.icon, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r)),
        child: Icon(icon, color: color, size: 20.sp),
      ),
      title: Text(title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.arrow_forward_ios_rounded,
          size: 14.sp, color: Colors.grey[400]),
      onTap: () {},
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(indent: 60.w, endIndent: 20.w, thickness: 0.5, height: 1);
  }
}
