import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/utils/spacing.dart';

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.white,
      elevation: 0,
      title: Text(
        'التنبيهات',
        style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w900,
            fontSize: 24.sp),
      ),
      actions: [
        IconButton(
          onPressed: () {}, // Mark all read logic
          icon: Icon(Icons.done_all_rounded,
              color: AppColors.primaryColor.withOpacity(0.5)),
        ),
        IconButton(
          onPressed: () {}, // Delete all logic
          icon:
              const Icon(Icons.delete_sweep_outlined, color: Colors.redAccent),
        ),
        horizontalSpace(10),
      ],
    );
  }
}
