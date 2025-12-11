import 'dart:math';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late AnimationController rotationController;
  late AnimationController bounceController;

  @override
  void initState() {
    super.initState();

    // Rotation animation for orbit
    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    // Bounce animation for icons
    bounceController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0.9,
      upperBound: 1.05,
    )..repeat(reverse: true);

    // Move to onboarding after delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  void dispose() {
    rotationController.dispose();
    bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0A1B69),
            Color(0xFF3F76E5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Glow Orbit Background
          AnimatedBuilder(
            animation: rotationController,
            builder: (_, child) {
              return Transform.rotate(
                angle: rotationController.value * 2 * pi,
                child: child,
              );
            },
            child: Image.asset(
              'assets/splash/orbit/glow.png',
              width: 280,
              height: 280,
            ),
          ),

          // Orbiting icons
          ..._buildOrbitIcons(),

          // Main Logo
          Image.asset(
            'assets/splash/logo.png',
            width: 240,
          ),

          // Bottom slogan
          Positioned(
            bottom: 70,
            child: FadeTransition(
              opacity: CurvedAnimation(
                  parent: bounceController, curve: Curves.easeIn),
              child: const Text(
                "Earn Stars.\nUnlock Rewards.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildOrbitIcons() {
    final icons = [
      'assets/splash/orbit/girl.png',
      'assets/splash/orbit/boy.png',
      'assets/splash/orbit/trophy.png',
      'assets/splash/orbit/star.png',
      'assets/splash/orbit/gift.png',
    ];

    return List.generate(icons.length, (i) {
      return AnimatedBuilder(
        animation: rotationController,
        builder: (_, child) {
          final angle = rotationController.value * 2 * pi + (i * (2 * pi / icons.length));
          final radius = 140.0;

          return Transform.translate(
            offset: Offset(
              cos(angle) * radius,
              sin(angle) * radius,
            ),
            child: ScaleTransition(
              scale: bounceController,
              child: Image.asset(
                icons[i],
                width: 55,
                height: 55,
              ),
            ),
          );
        },
      );
    });
  }
}
