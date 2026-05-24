import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zakaty/onboarding/onboarding_app.dart';

void main() {
  testWidgets('Zakaty onboarding opens on the splash screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ZakatyOnboardingApp());

    expect(find.byKey(const ValueKey('zakaty-logo')), findsOneWidget);
  });
}
