import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/shared/cubit/main_scaffold_cubit.dart';
import 'package:minwen/features/home/presentation/pages/home_screen.dart';
import 'package:minwen/features/posts/presentation/pages/create_post_screen.dart';
import 'package:minwen/features/posts/presentation/pages/posts_screen.dart';
import 'package:minwen/features/profile/presentation/pages/profile_screen.dart';
import 'package:minwen/features/trophy/presentation/pages/trophy_screen.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  final List<Widget> _pages = const [
    HomeScreen(),
    TrophyScreen(),
    CreatePostScreen(),
    PostsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScaffoldCubit, MainScaffoldState>(
      builder: (context, state) {
        final cubit = context.read<MainScaffoldCubit>();
        int selectedIndex = cubit.currentIndex;

        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          body: IndexedStack(
            index: selectedIndex,
            children: _pages,
          ),
          bottomNavigationBar: _buildModernNavBar(context, selectedIndex),
        );
      },
    );
  }

  Widget _buildModernNavBar(BuildContext context, int selectedIndex) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 8.h),
      height: 60.h,
      child: Stack(
        children: [
          // 1. تأثير الزجاج الضبابي (Glass Background)
          ClipRRect(
            borderRadius: BorderRadius.circular(30.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1B4332).withOpacity(0.85),
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),

          // 2. العناصر والـ Indicator
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(context, Icons.home_filled, 0, selectedIndex),
                _navItem(context, Icons.emoji_events_rounded, 1, selectedIndex),
                _buildCenterButton(context, selectedIndex), // زر الإضافة المميز
                _navItem(context, Icons.explore_rounded, 3, selectedIndex),
                _navItem(context, Icons.person, 4, selectedIndex),
              ],
            ),
          ),
        ],
      ),
    )
        .animate()
        .slideY(begin: 1, end: 0, duration: 800.ms, curve: Curves.easeOutQuart);
  }

  Widget _navItem(
      BuildContext context, IconData icon, int index, int selectedIndex) {
    bool isSelected = selectedIndex == index;
    const Color activeColor = Color(0xFFC59849);

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact(); // اهتزاز خفيف عند اللمس
        context.read<MainScaffoldCubit>().changeIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? activeColor : Colors.white.withOpacity(0.5),
            size: 24.sp,
          )
              .animate(target: isSelected ? 1 : 0)
              .scale(end: const Offset(1.2, 1.2))
              .shake(hz: 2),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 4.h),
              height: 4.h,
              width: 4.h,
              decoration: const BoxDecoration(
                color: activeColor,
                shape: BoxShape.circle,
              ),
            ).animate().scale().fadeIn(),
        ],
      ),
    );
  }

  // زر الإضافة في المنتصف بتصميم بارز
  Widget _buildCenterButton(BuildContext context, int selectedIndex) {
    bool isSelected = selectedIndex == 2;
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        context.read<MainScaffoldCubit>().changeIndex(2);
      },
      child: Container(
        height: 50.h,
        width: 50.h,
        decoration: BoxDecoration(
          color: const Color(0xFFC59849),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFC59849).withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 32.sp,
        ),
      )
          .animate(
              target: isSelected
                  ? 1
                  : 0) //when is selectd true the animation will happen else not happen
          .rotate(begin: 0, end: 0.125), // يدور قليلاً ليصبح x عند الاختيار
    );
  }
}
