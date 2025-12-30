import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/themes/app_text_styles.dart';
import 'package:minwen/core/utils/spacing.dart';
import 'package:minwen/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:minwen/features/notification/presentation/widgets/notification_app_bar.dart';
import 'package:minwen/features/notification/presentation/widgets/notification_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> dummyNotifications = [
    {
      "id": 1,
      "title": "تمت الإجابة",
      "body": "قام توني بالرد على استفسارك بخصوص 'آيفون 15'",
      "time": "2m ago",
      "isRead": false,
      "type": "reply"
    },
    {
      "id": 2,
      "title": "مكافأة مساعدة",
      "body": "حصلت على 100 نقطة لمساعدتك 'محمد' في العثور على قطع غيار",
      "time": "1h ago",
      "isRead": false,
      "type": "reward"
    },
  ];

  // وظيفة تأكيد الحذف
  Future<bool?> _confirmDelete(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: Text('حذف التنبيه',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp)),
        content:
            const Text('هل أنت متأكد من رغبتك في حذف هذا التنبيه نهائياً؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('إلغاء', style: TextStyle(color: Colors.grey[600])),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('حذف',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.h), child: NotificationAppBar()),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationILoadedState) {
            if (dummyNotifications.isEmpty) {
              return _buildEmptyState();
            }
            return ListView.builder(
              itemCount: dummyNotifications.length,
              padding: EdgeInsets.all(20.w),
              itemBuilder: (context, index) {
                final item = dummyNotifications[index];
                return _buildModernDismissible(item, index, context);
              },
            );
          } else if (state is NotificationLoadingState) {
            return _buildLoadingState();
          } else if (state is NotificationErrorState) {
            return Center(
              child: Text(
                'Something went wrong!',
                style:
                    AppTextStyles.font14BlackMedium.copyWith(color: Colors.red),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildModernDismissible(
      Map<String, dynamic> item, int index, BuildContext context) {
    return Dismissible(
      key: Key(item['id'].toString()),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) => _confirmDelete(context),
      onDismissed: (direction) {
        setState(() {
          dummyNotifications.removeAt(index);
        });
      },
      background: _buildDeleteBackground(),
      child: NotificationTile(item: item),
    ).animate().fadeIn(delay: (index * 80).ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildDeleteBackground() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 25.w),
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: const Icon(Icons.delete_rounded, color: Colors.white, size: 28),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none_rounded,
              size: 60.sp, color: Colors.grey[300]),
          verticalSpace(10),
          Text('لا توجد تنبيهات جديدة',
              style: TextStyle(color: Colors.grey[400], fontSize: 14.sp)),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 6,
        padding: EdgeInsets.all(20.w),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const NotificationTile(
            item: {
              "id": 0,
              "title": "جاري التحميل...",
              "body":
                  "هذا النص مجرد مكان مؤقت لوصف التنبيه الذي سيظهر هنا لاحقاً",
              "time": "now",
              "isRead": true,
              "type": "reply"
            },
          );
        },
      ),
    );
  }
}
