import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/themes/app_text_styles.dart';
import 'package:minwen/core/utils/spacing.dart';

class HomeRecentPageView extends StatefulWidget {
  const HomeRecentPageView({super.key});

  @override
  State<HomeRecentPageView> createState() => _HomeRecentPageViewState();
}

class _HomeRecentPageViewState extends State<HomeRecentPageView> {
  late PageController _productPageController;
  double _currentScrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _productPageController = PageController(viewportFraction: 0.7)
      ..addListener(_handlePageScroll);
  }

  void _handlePageScroll() {
    setState(() {
      _currentScrollOffset = _productPageController.page ?? 0.0;
    });
  }

  @override
  void dispose() {
    _productPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420.h,
      child: PageView.builder(
        controller: _productPageController,
        itemCount: 4, // 5 صفحات × 2 عناصر في كل صفحة = 10 عناصر إجمالاً
        padEnds: false,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          // حساب الـ scale بناءً على القرب من المركز
          final double distanceToCenter = (_currentScrollOffset - index).abs();
          final double scaleFactor =
              (1 - (distanceToCenter * 0.15)).clamp(0.85, 1.0);

          return Transform.scale(
            scale: scaleFactor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                children: [
                  // استخدام معادلة (index * 2) لضمان عدم تكرار البيانات
                  Expanded(child: ProductCardItem(index: index * 2)),
                  verticalSpace(16),
                  Expanded(child: ProductCardItem(index: index * 2 + 1)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductCardItem extends StatelessWidget {
  final int index;
  const ProductCardItem({super.key, required this.index});

  // قائمة صور منتجات متنوعة لتعطي شكل حقيقي للتطبيق
  static const List<String> _productImages = [
    'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&q=80', // Watch
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&q=80', // Red Shoes
    'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&q=80', // Headphones
    'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=500&q=80', // Camera
    'https://images.unsplash.com/photo-1585333127302-c29207229d04?w=500&q=80', // Laptop
    'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=500&q=80', // Glasses
    'https://images.unsplash.com/photo-1591337676887-a217a6970c8a?w=500&q=80', // iPhone
    'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=500&q=80', // Smart Watch
  ];

  @override
  Widget build(BuildContext context) {
    // اختيار الصورة بناءً على الاندكس مع ضمان عدم تخطي طول القائمة
    final String imageUrl = _productImages[index % _productImages.length];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserHeader(),
          _buildProductImage(imageUrl),
          _buildProductDetails(),
        ],
      ),
    );
  }

  Widget _buildUserHeader() {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12.r,
            backgroundImage:
                const NetworkImage('https://i.pravatar.cc/150?u=20'),
          ),
          horizontalSpace(8),
          Expanded(
            child: Text(
              'Tony Mikhael',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage(String imageUrl) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey[100],
              child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2)),
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.broken_image_outlined),
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'من وين اشتري ده؟',
            style: AppTextStyles.font12BlackRegular.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(2),
          Text(
            'أبحث عن أفضل سعر ومكان',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 9.sp,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
