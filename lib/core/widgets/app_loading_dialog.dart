import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class AppLoadingDialog {
  /// دالة إظهار التحميل بتصميم عصري
  static void show(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false, // منع الإغلاق العشوائي
      barrierColor: Colors.white.withOpacity(0.3), // خلفية شفافة ناعمة
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(30.r), // زوايا دائرية كبيرة لمظهر مودرن
        ),
        content: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // عرض الأنميشن الخاص بك
              Lottie.asset(
                'assets/animations/loading.json',
                width: 120.w,
                height: 120.w,
                fit: BoxFit.contain,
              ),

              if (message != null) ...[
                SizedBox(height: 12.h),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1B4332), // لون البراند الأخضر الداكن
                    letterSpacing: 0.2,
                  ),
                ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// دالة إخفاء التحميل
  static void hide(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
