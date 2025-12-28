import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:minwen/core/utils/spacing.dart';

class HomeBanners extends StatefulWidget {
  const HomeBanners({super.key});

  @override
  State<HomeBanners> createState() => _HomeBannersState();
}

class _HomeBannersState extends State<HomeBanners> {
  int _currentSlide = 0;

  // قائمة صور ممولين (Sponsors) - صور حقيقية تعبر عن التسوق والبراندات
  final List<Map<String, String>> _sponsors = [
    {
      'image':
          'https://thegulfentrepreneur.com/wp-content/uploads/2024/08/Talabat-IPO.jpg', // Shopping Sale
      'tag': 'Sponsored',
    },
    {
      'image':
          'https://thegulfentrepreneur.com/wp-content/uploads/2024/08/Talabat-IPO.jpg', // Nike / Shoes
      'tag': 'Sponsored',
    },
    {
      'image':
          'https://thegulfentrepreneur.com/wp-content/uploads/2024/08/Talabat-IPO.jpg', // Electronics
      'tag': 'Sponsored',
    },
    {
      'image':
          'https://thegulfentrepreneur.com/wp-content/uploads/2024/08/Talabat-IPO.jpg', // Fashion Store
      'tag': 'Sponsored',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 160.h,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayInterval: const Duration(seconds: 5), // زيادة الوقت قليلاً
            enlargeCenterPage: true,
            enlargeFactor: 0.2, // تقليل التكبير لجعله أنعم
            viewportFraction: 0.85, // جعل البانر أعرض قليلاً
            onPageChanged: (index, reason) {
              setState(() {
                _currentSlide = index;
              });
            },
          ),
          items: _sponsors.map((sponsor) {
            return _buildBannerItem(sponsor['image']!, sponsor['tag']!);
          }).toList(),
        ),
        verticalSpace(12),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildBannerItem(String imageUrl, String tag) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            // الصورة الأساسية
            CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              placeholder: (context, url) => Container(
                color: Colors.grey[100],
                child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),

            // Gradient لإبراز النصوص
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.transparent,
                    Colors.black.withOpacity(0.1),
                  ],
                ),
              ),
            ),

            // "Sponsored" Tag
            Positioned(
              top: 12.h,
              right: 12.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _sponsors.asMap().entries.map((entry) {
        bool isActive = _currentSlide == entry.key;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isActive ? 18.w : 6.w,
          height: 6.h,
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isActive
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.2),
          ),
        );
      }).toList(),
    );
  }
}
