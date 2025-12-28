import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/utils/spacing.dart';

class PostCard extends StatelessWidget {
  final int index;
  const PostCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          verticalSpace(12),
          Text(
            'أبحث عن محل يبيع شاشات أصلية لسيارات تسلا في منطقة التجمع، هل من اقتراحات؟',
            style: TextStyle(
                fontSize: 14.sp, height: 1.5, fontWeight: FontWeight.w500),
          ),
          verticalSpace(16),
          _buildPostImage(),
          verticalSpace(16),
          _buildStats(),
          const Divider(height: 32),
          _buildActions(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
            radius: 18.r,
            backgroundImage:
                NetworkImage('https://i.pravatar.cc/150?u=$index')),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('سارة أحمد',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
            Text('منذ 15 دقيقة • إلكترونيات',
                style: TextStyle(color: Colors.grey, fontSize: 10.sp)),
          ],
        ),
        const Spacer(),
        Icon(Icons.more_vert_rounded, color: Colors.grey[400]),
      ],
    );
  }

  Widget _buildPostImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.network(
        'https://picsum.photos/800/500?random=$index',
        height: 200.h,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        _stackAvatars(),
        horizontalSpace(8),
        Text('24 شخص ساعدها',
            style: TextStyle(color: Colors.grey[600], fontSize: 11.sp)),
        const Spacer(),
        Text('8 ردود',
            style: TextStyle(color: Colors.grey[600], fontSize: 11.sp)),
      ],
    );
  }

  Widget _stackAvatars() {
    return SizedBox(
      width: 45.w,
      height: 20.h,
      child: Stack(
        children: List.generate(
            3,
            (i) => Positioned(
                  left: i * 12.0,
                  child: CircleAvatar(
                    radius: 10.r,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                        radius: 8.r,
                        backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?u=${i + 10}')),
                  ),
                )),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _actionItem(
            Icons.volunteer_activism_outlined, "ساعد", const Color(0xFF1B4332)),
        _actionItem(Icons.chat_bubble_outline_rounded, "رد", Colors.grey[600]!),
        _actionItem(Icons.share_outlined, "نشر", Colors.grey[600]!),
      ],
    );
  }

  Widget _actionItem(IconData icon, String label, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20.sp),
        horizontalSpace(6),
        Text(label,
            style: TextStyle(
                color: color, fontSize: 12.sp, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
