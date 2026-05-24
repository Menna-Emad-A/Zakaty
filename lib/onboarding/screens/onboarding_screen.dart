import 'package:flutter/material.dart';

import '../onboarding_colors.dart';
import '../widgets/onboarding_art.dart';
import '../widgets/scenic_background.dart';
import 'auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const routeName = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _page = 0;

  static const _slides = [
    _Slide(
      title: 'Give with Purpose',
      body:
          "Manage your Zakat easily and make a\nreal difference in people's lives.",
      art: OnboardingArtType.purpose,
    ),
    _Slide(
      title: 'Calculate Your Zakat\nAccurately',
      body:
          'Quickly calculate your Zakat and track\nyour giving with clear records.',
      art: OnboardingArtType.calculate,
    ),
    _Slide(
      title: 'Give with Trust & Transparency',
      body:
          'Donate securely and ensure your Zakat\nreaches those who need it most',
      art: OnboardingArtType.trust,
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_page < _slides.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    } else {
      Navigator.pushReplacementNamed(context, AuthScreen.loginRouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: _slides.length,
        onPageChanged: (value) => setState(() => _page = value),
        itemBuilder: (context, index) {
          final slide = _slides[index];
          return ScenicBackground(
            variant: ScenicVariant.onboarding,
            foreground: OnboardingArt(type: slide.art),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 28),
                    const Spacer(flex: 35),
                    Text(
                      slide.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: OnboardingColors.ink,
                        fontSize: 17,
                        height: 1.22,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            color: Colors.white30,
                            blurRadius: 4,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      slide.body,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        height: 1.35,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            color: Colors.black54,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 26),
                    SizedBox(
                      width: double.infinity,
                      height: 36,
                      child: OutlinedButton(
                        onPressed: _next,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: OnboardingColors.cream,
                          foregroundColor: OnboardingColors.copper,
                          side: const BorderSide(
                            color: OnboardingColors.copper,
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed:
                          () => Navigator.pushReplacementNamed(
                            context,
                            AuthScreen.loginRouteName,
                          ),
                      style: TextButton.styleFrom(
                        foregroundColor: OnboardingColors.ink,
                        minimumSize: const Size(70, 32),
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const Spacer(flex: 34),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Slide {
  const _Slide({required this.title, required this.body, required this.art});

  final String title;
  final String body;
  final OnboardingArtType art;
}
