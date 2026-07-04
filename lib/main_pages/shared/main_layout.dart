import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../assets/assets_page.dart';
import 'custom_bottom_nav.dart';
import 'app_colors.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const AssetsPage(),
    const Center(child: Text('Charity Page', style: TextStyle(color: Colors.white))),
    const Center(child: Text('Reports Page', style: TextStyle(color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    // Select background gradient based on current page
    LinearGradient bgGradient = _currentIndex == 1 
        ? AppColors.assetsBackgroundGradient 
        : AppColors.homeBackgroundGradient;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: bgGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              // The main content of the page
              Positioned.fill(
                child: _pages[_currentIndex],
              ),
              
              // The bottom navigation bar
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: CustomBottomNav(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
