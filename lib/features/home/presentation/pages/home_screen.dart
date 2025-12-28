import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:minwen/core/shared/cubit/main_scaffold_cubit.dart';
import 'package:minwen/core/themes/app_colors.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:minwen/core/themes/app_text_styles.dart';
import 'package:minwen/core/utils/spacing.dart';
import 'package:minwen/features/home/presentation/widgets/home_app_bar.dart';
import 'package:minwen/features/home/presentation/widgets/home_banners.dart';
import 'package:minwen/features/home/presentation/widgets/home_recent_page_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFC),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                verticalSpace(16),
                const HomeBanners(),
                verticalSpace(16),
                // العنوان
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Added',
                      style: AppTextStyles.font16BlackSemiBold,
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<MainScaffoldCubit>().changeIndex(3);
                      },
                      child: Text(
                        'See All',
                        style: AppTextStyles.font14BlackRegular.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                verticalSpace(12),
                HomeRecentPageView(),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
