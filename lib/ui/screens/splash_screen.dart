import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'dart:math';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget orbitItem(IconData icon, Color glow) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: glow.withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            color: glow.withOpacity(0.8),
            blurRadius: 25,
            spreadRadius: 8,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1B69),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A1B69),
              Color(0xFF3F76E5),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * pi,
                  child: SizedBox(
                    width: 460,
                    height: 460,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 15,
                          left: 460 / 2 - 20,
                          child: orbitItem(Icons.child_care, Colors.cyanAccent),
                        ),
                        Positioned(
                          left: 0,
                          top: 460 / 2 - 20,
                          child: orbitItem(Icons.star, Colors.yellowAccent),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 460 / 2 - 20,
                          child: orbitItem(Icons.face, Colors.pinkAccent),
                        ),
                        Positioned(
                          right: 0,
                          top: 460 / 2 - 20,
                          child: orbitItem(Icons.card_giftcard, Colors.redAccent),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Center(
              child: SizedBox(
                width: 320,
                height: 320,
                child: GifView.asset(
                  'assets/splash/glow.gif',
                  frameRate: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/splash/branding/kiddo_512.png',
                width: 230,
              ),
            ),
            Positioned(
              bottom: 70,
              child: Column(
                children: const [
                  Text(
                    'Earn Stars.',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFC35C),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Unlock Rewards.',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFC35C),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
