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

    /// 5 saniye sonra onboarding'e geç
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, "/onboarding");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget orbitItem(String path, Color glow) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: glow.withOpacity(0.8),
            blurRadius: 25,
            spreadRadius: 8,
          ),
        ],
      ),
      child: Image.asset(path, width: 40),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1B69),
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// 🔵 BACKGROUND GRADIENT
          Container(
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
          ),

          /// 🔥 ORBIT ANIMATION (Expanded radius & more outer spacing)
AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    return Transform.rotate(
      angle: _controller.value * 2 * pi,
      child: SizedBox(
        width: 460,   // orbit ring width (380 → 460)
        height: 460,  // orbit ring height
        child: Stack(
          children: [
            /// Boy (top) - biraz içeri aldık
            Positioned(
              top: 15,                      // 0 → 15
              left: 460 / 2 - 20,
              child: orbitItem("assets/splash/orbit/boy.png", Colors.cyanAccent),
            ),

            /// Star (left)
            Positioned(
              left: 0,
              top: 460 / 2 - 20,
              child: orbitItem("assets/splash/orbit/star.png", Colors.yellowAccent),
            ),

            /// Girl (bottom) - biraz içeri aldık
            Positioned(
              bottom: 15,                   // 0 → 15
              left: 460 / 2 - 20,
              child: orbitItem("assets/splash/orbit/girl.png", Colors.pinkAccent),
            ),

            /// Gift (right)
            Positioned(
              right: 0,
              top: 460 / 2 - 20,
              child: orbitItem("assets/splash/orbit/gift.png", Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  },
),

          /// ✨ EXISTING GLOW GIF
          Center(
            child: SizedBox(
              width: 320,
              height: 320,
              child: GifView.asset(
                "assets/splash/glow.gif",
                frameRate: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 🎨 LOGO
          Center(
            child: Image.asset(
              "assets/splash/branding/kiddo_512.png",
              width: 230,
            ),
          ),

          /// ⭐ SLOGAN
          Positioned(
            bottom: 70,
            child: Column(
              children: const [
                Text(
                  "Earn Stars.",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFC35C),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Unlock Rewards.",
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
    );
  }
}
