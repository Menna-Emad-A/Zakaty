import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground.withOpacity(0.8), // rgba(0, 0, 0, 0.004) with some opacity so it's visible, the image looks like it has a dark transparent bg. Actually CSS says rgba(0, 0, 0, 0.004) but image shows a dark pill. Let's use a semi-transparent dark color.
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _buildNavItem(0, 'Home', Icons.home_filled)),
          Expanded(child: _buildNavItem(1, 'Assets', Icons.layers)),
          Expanded(child: _buildNavItem(2, 'Charity', Icons.volunteer_activism)),
          Expanded(child: _buildNavItem(3, 'Reports', Icons.bar_chart)),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String label, IconData icon) {
    final isSelected = currentIndex == index;
    
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(25),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.backgroundLight,
              size: 20,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: GoogleFonts.arefRuqaaInk(
                  color: AppColors.backgroundLight,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
