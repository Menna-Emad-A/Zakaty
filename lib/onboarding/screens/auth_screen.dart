import 'package:flutter/material.dart';

import '../onboarding_colors.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen.login({super.key}) : isSignup = false;
  const AuthScreen.signup({super.key}) : isSignup = true;

  static const loginRouteName = '/login';
  static const signupRouteName = '/signup';

  final bool isSignup;

  @override
  Widget build(BuildContext context) {
    final fields =
        isSignup
            ? const [
              _AuthField(label: 'Username'),
              _AuthField(label: 'E-mail'),
              _AuthField(label: 'Password', obscure: true),
              _AuthField(label: 'Confirm Password', obscure: true),
            ]
            : const [
              _AuthField(label: 'Username'),
              _AuthField(label: 'E-mail'),
              _AuthField(label: 'Password', obscure: true),
            ];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/onboarding/auth_background.jpg',
            fit: BoxFit.cover,
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xCC052E3F),
                  Color(0x88B7D4DE),
                  Color(0xDD063247),
                ],
                stops: [.04, .52, 1],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 36, 24, 28),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.sizeOf(context).height -
                      MediaQuery.paddingOf(context).vertical -
                      64,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/onboarding/zakaty_logo.png',
                      width: 122,
                      height: 156,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'ZAKATY',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: OnboardingColors.ink,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: isSignup ? 38 : 62),
                    Text(
                      isSignup ? 'Create Account' : 'Welcome Back',
                      style: const TextStyle(
                        color: OnboardingColors.cream,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.fromLTRB(13, 15, 13, 11),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: OnboardingColors.copper,
                          width: 1.1,
                        ),
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withValues(alpha: .06),
                      ),
                      child: Column(
                        children: [
                          ...fields,
                          if (!isSignup)
                            Row(
                              children: [
                                SizedBox(
                                  width: 19,
                                  height: 19,
                                  child: Checkbox(
                                    value: false,
                                    onChanged: (_) {},
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    side: const BorderSide(
                                      color: OnboardingColors.ink,
                                      width: 1.2,
                                    ),
                                    fillColor: WidgetStateProperty.all(
                                      Colors.transparent,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  'Remember me',
                                  style: TextStyle(
                                    color: OnboardingColors.ink,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(96, 24),
                                    foregroundColor: OnboardingColors.ink,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 40,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: OnboardingColors.cream,
                          foregroundColor: OnboardingColors.copper,
                          side: const BorderSide(
                            color: OnboardingColors.copper,
                            width: 1.8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          isSignup ? 'Sign Up' : 'Log in',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    const _OrDivider(),
                    const SizedBox(height: 13),
                    const Row(
                      children: [
                        Expanded(child: _SocialButton(label: 'with Google')),
                        SizedBox(width: 12),
                        Expanded(
                          child: _SocialButton(
                            label: 'with Facebook',
                            mark: 'f',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    _AuthSwitch(isSignup: isSignup),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthField extends StatelessWidget {
  const _AuthField({required this.label, this.obscure = false});

  final String label;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      cursorColor: OnboardingColors.copper,
      style: const TextStyle(color: Colors.white, fontSize: 13),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(9, 7, 9, 9),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: OnboardingColors.copper, width: 1.2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: OnboardingColors.copper, width: 1.6),
        ),
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: OnboardingColors.copper, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'OR',
            style: TextStyle(
              color: OnboardingColors.copper,
              fontSize: 9,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(child: Divider(color: OnboardingColors.copper, thickness: 1)),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.label, this.mark = 'G+'});

  final String label;
  final String mark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: OnboardingColors.cream,
          foregroundColor: OnboardingColors.copper,
          side: const BorderSide(color: OnboardingColors.copper, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                mark,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthSwitch extends StatelessWidget {
  const _AuthSwitch({required this.isSignup});

  final bool isSignup;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          isSignup
              ? 'Already have an account ? '
              : "Don't you have an account ? ",
          style: const TextStyle(
            color: OnboardingColors.ink,
            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
        GestureDetector(
          onTap:
              () => Navigator.pushReplacementNamed(
                context,
                isSignup
                    ? AuthScreen.loginRouteName
                    : AuthScreen.signupRouteName,
              ),
          child: Text(
            isSignup ? 'Log in' : 'Sign Up',
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
