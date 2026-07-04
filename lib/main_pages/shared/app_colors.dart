import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors
  static const Color mainColor = Color(0xFF011B27);
  static const Color main2Color = Color(0xFFA66A34);
  static const Color secondaryColor = Color(0xFFB4AAA1);
  static const Color secondary2Color = Color(0xFF88ABC2);
  
  // Backgrounds
  static const Color backgroundLight = Color(0xFFFAEBDD);
  static const Color backgroundLight2 = Color(0xFFE5DFD8);
  static const Color cardBackground = Color(0x01000000); // rgba(0,0,0,0.004) is almost transparent, but we might want a slightly opaque one for cards if it looks invisible
  static const Color cardShadow = Color(0x40000000); // rgba(0,0,0,0.25)

  // Chart Colors
  static const Color goldAsset = Color(0xFFE59528);
  static const Color realEstateAsset = Color(0xFF2F5D8B);
  static const Color cashAsset = Color(0xFF6299C6);
  static const Color businessAsset = Color(0xFF248298);
  static const Color othersAsset = Color(0xFF02396D);

  // Gradients
  static const LinearGradient homeBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x80011B27), // rgba(1, 27, 39, 0.5)
      Color(0xFF4A697B),
      Color(0xFF88ABC2),
      Color(0xFFBAC7CE),
      Color(0xFF011B27),
    ],
    stops: [0.0, 0.1317, 0.483, 0.6373, 1.0],
  );

  static const LinearGradient assetsBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF011B27),
      Color(0xFF4A697B),
      Color(0xFF88ABC2),
      Color(0xFFBAC7CE),
      Color(0xFF011B27),
    ],
    stops: [0.0023, 0.3077, 0.483, 0.6373, 1.0],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF023E5A),
      Color(0xFF035074),
      Color(0xFF04628D),
    ],
    stops: [0.0325, 0.0933, 0.984],
  );
  
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF88ABC2),
      Color(0xFF40515C),
    ],
  );
}
