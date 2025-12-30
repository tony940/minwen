import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/themes/app_text_styles.dart';
import 'package:minwen/core/utils/spacing.dart';
import 'package:minwen/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:minwen/features/notification/presentation/widgets/notification_app_bar.dart';
import 'package:minwen/features/notification/presentation/widgets/notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // English Dataset
  List<Map<String, dynamic>> dummyNotifications = [
    {
      "id": 1,
      "title": "Reply Received",
      "body": "Tony replied to your question about 'iPhone 15'",
      "time": "2m ago",
      "isRead": false,
      "type": "reply"
    },
    {
      "id": 2,
      "title": "Reward Points",
      "body": "You earned 100 points for helping 'Mohamed' find car parts",
      "time": "1h ago",
      "isRead": false,
      "type": "reward"
    },
  ];

  // Slimmer Alert Dialog
  Future<bool?> _confirmDelete(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text('Delete Notification',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
        content: Text('Are you sure you want to permanently delete this?',
            style: TextStyle(fontSize: 13.sp, color: Colors.black54)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel',
                style: TextStyle(color: Colors.grey[600], fontSize: 13.sp)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Delete',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h), // Slimmer header
          child: const NotificationAppBar()),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationILoadedState) {
            if (dummyNotifications.isEmpty) {
              return _buildEmptyState();
            }
            return ListView.separated(
              itemCount: dummyNotifications.length,
              padding: EdgeInsets.symmetric(
                  horizontal: 12.w, vertical: 12.h), // Tight padding
              separatorBuilder: (context, index) =>
                  verticalSpace(8.h), // Compact gap
              itemBuilder: (context, index) {
                final item = dummyNotifications[index];
                return _buildModernDismissible(item, index, context);
              },
            );
          } else if (state is NotificationLoadingState) {
            return _buildLoadingState();
          } else if (state is NotificationErrorState) {
            return _buildErrorState();
          } else {
            return const SizedBox.shrink();
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
    )
        .animate()
        .fadeIn(duration: 300.ms, delay: (index * 50).ms)
        .slideX(begin: 0.05, end: 0);
  }

  Widget _buildDeleteBackground() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.w),
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: BorderRadius.circular(12.r), // Slimmer radius
      ),
      child:
          Icon(Icons.delete_outline_rounded, color: Colors.white, size: 22.sp),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none_rounded,
              size: 50.sp, color: Colors.grey[300]),
          verticalSpace(8),
          Text('No new notifications',
              style: TextStyle(color: Colors.grey[500], fontSize: 13.sp)),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Text('Something went wrong!',
          style: AppTextStyles.font14BlackMedium
              .copyWith(color: Colors.red, fontSize: 13.sp)),
    );
  }

  Widget _buildLoadingState() {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        itemCount: 8,
        padding: EdgeInsets.all(12.w),
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => verticalSpace(8.h),
        itemBuilder: (context, index) {
          return const NotificationTile(
            item: {
              "title": "Loading...",
              "body": "Placeholder text for notification content description",
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
