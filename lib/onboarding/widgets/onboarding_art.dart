import 'package:flutter/material.dart';

enum OnboardingArtType { purpose, calculate, trust }

class OnboardingArt extends StatelessWidget {
  const OnboardingArt({super.key, required this.type});

  final OnboardingArtType type;

  @override
  Widget build(BuildContext context) {
    final asset = switch (type) {
      OnboardingArtType.purpose => 'assets/onboarding/purpose.png',
      OnboardingArtType.calculate => 'assets/onboarding/calculate.png',
      OnboardingArtType.trust => 'assets/onboarding/trust.png',
    };

    return Positioned.fill(
      child: IgnorePointer(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            return Stack(
              children: [
                Positioned(
                  left: type == OnboardingArtType.purpose ? -width * .12 : 0,
                  right: type == OnboardingArtType.purpose ? -width * .12 : 0,
                  bottom: 0,
                  child: Image.asset(
                    asset,
                    key: ValueKey('onboarding-art-${type.name}'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
