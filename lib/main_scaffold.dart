import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minwen/core/shared/cubit/main_scaffold_cubit.dart';
import 'package:minwen/features/home/presentation/pages/home_screen.dart';
import 'package:minwen/features/trophy/presentation/pages/trophy_screen.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  final List<Widget> _pages = const [
    HomeScreen(),
    TrophyScreen(),
    DummyPage(text: "Create New", icon: Icons.add_rounded),
    DummyPage(text: "Grid View", icon: Icons.grid_view_rounded),
    DummyPage(text: "Profile Screen", icon: Icons.person_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScaffoldCubit, MainScaffoldState>(
      builder: (context, state) {
        final cubit = context.read<MainScaffoldCubit>();
        int selectedIndex = cubit.currentIndex;
        return Scaffold(
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: selectedIndex,
            children: _pages,
          ),
          bottomNavigationBar: _buildBottomNavBar(context, selectedIndex),
        );
      },
    );
  }

  Widget _buildBottomNavBar(BuildContext context, int selectedIndex) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
      height: 60.h,
      decoration: BoxDecoration(
        color: const Color(0xFF2D5A4F).withOpacity(0.95),
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navItem(context, Icons.home_rounded, 0, selectedIndex),
          _navItem(context, Icons.emoji_events_rounded, 1, selectedIndex),
          _navItem(context, Icons.add_rounded, 2, selectedIndex, isBig: true),
          _navItem(context, Icons.grid_view_rounded, 3, selectedIndex),
          _navItem(context, Icons.person_rounded, 4, selectedIndex),
        ],
      ),
    )
        .animate()
        .slideY(begin: 1, end: 0, duration: 600.ms, curve: Curves.easeOutBack);
  }

  Widget _navItem(
      BuildContext context, IconData icon, int index, int selectedIndex,
      {bool isBig = false}) {
    bool isSelected = selectedIndex == index;
    const Color accentColor = Color(0xFFC59849);

    return Flexible(
      child: GestureDetector(
        onTap: () => context.read<MainScaffoldCubit>().changeIndex(index),
        child: AnimatedContainer(
          duration: 300.ms,
          curve: Curves.easeInOut,
          height: 48.h,
          width: 48.h,
          decoration: BoxDecoration(
            color: isSelected ? accentColor : accentColor.withOpacity(0.15),
            shape: BoxShape.circle,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: accentColor.withOpacity(0.4),
                      blurRadius: 15,
                      spreadRadius: 2,
                    )
                  ]
                : [],
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.black : accentColor,
            size: isBig ? 28.sp : 22.sp,
          )
              .animate(target: isSelected ? 1 : 0)
              .scale(begin: const Offset(1, 1), end: const Offset(1.1, 1.1)),
        ),
      ),
    );
  }
}

// الـ DummyPage كما هي
class DummyPage extends StatelessWidget {
  final String text;
  final IconData icon;
  const DummyPage({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: 80.sp, color: const Color(0xFF2D5A4F).withOpacity(0.1)),
          SizedBox(height: 16.h),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF2D5A4F),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ).animate().fadeIn(duration: 400.ms).scale(begin: const Offset(0.9, 0.9)),
    );
  }
}
