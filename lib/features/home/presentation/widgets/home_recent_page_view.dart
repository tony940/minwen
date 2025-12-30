import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    _productPageController =
        PageController(viewportFraction: 0.65) // Slimmer fraction
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
      height: 380.h, // Slimmer overall height
      child: PageView.builder(
        controller: _productPageController,
        itemCount: 4,
        padEnds: false,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final double distanceToCenter = (_currentScrollOffset - index).abs();
          final double scaleFactor =
              (1 - (distanceToCenter * 0.12)).clamp(0.88, 1.0);

          return Transform.scale(
            scale: scaleFactor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                children: [
                  Expanded(child: ProductCardItem(index: index * 2)),
                  verticalSpace(10.h), // Tightened vertical gap
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

  static const List<String> _productImages = [
    'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&q=80',
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&q=80',
    'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&q=80',
    'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=500&q=80',
    'https://images.unsplash.com/photo-1585333127302-c29207229d04?w=500&q=80',
    'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=500&q=80',
    'https://images.unsplash.com/photo-1591337676887-a217a6970c8a?w=500&q=80',
    'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=500&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    final String imageUrl = _productImages[index % _productImages.length];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r), // Slimmer radius
        border:
            Border.all(color: Colors.grey[100]!, width: 1), // Surgical border
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
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10.r, // Compact avatar
            backgroundImage:
                const NetworkImage('https://i.pravatar.cc/150?u=20'),
          ),
          horizontalSpace(6),
          Expanded(
            child: Text(
              'Tony Mikhael',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 9.sp,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
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
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(color: Colors.grey[50]),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline),
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.w, 6.h, 10.w, 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Where to buy this?',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 10.sp,
              color: Colors.black,
            ),
            maxLines: 1,
          ),
          Text(
            'Looking for best deals',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
