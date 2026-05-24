import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap:
            () => Navigator.pushReplacementNamed(
              context,
              OnboardingScreen.routeName,
            ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/onboarding/splash_background.png',
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF003044),
                    Color(0x665B8797),
                    Colors.transparent,
                  ],
                  stops: [.02, .52, 1],
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  const Spacer(flex: 31),
                  Image.asset(
                    'assets/onboarding/zakaty_logo.png',
                    key: const ValueKey('zakaty-logo'),
                    width: 176,
                    fit: BoxFit.contain,
                  ),
                  const Spacer(flex: 69),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
