import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/auth_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/splash_screen.dart';

class ZakatyOnboardingApp extends StatelessWidget {
  const ZakatyOnboardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFF111111),
      ),
      child: MaterialApp(
        title: 'Zakaty',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'serif',
          scaffoldBackgroundColor: const Color(0xFF0B2F3D),
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (_) => const SplashScreen(),
          OnboardingScreen.routeName: (_) => const OnboardingScreen(),
          AuthScreen.loginRouteName: (_) => const AuthScreen.login(),
          AuthScreen.signupRouteName: (_) => const AuthScreen.signup(),
        },
      ),
    );
  }
}
