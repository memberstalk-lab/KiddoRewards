import 'package:flutter/material.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<String> images = [
    "assets/splash/onboarding/screen1.png",
    "assets/splash/onboarding/screen2.png",
    "assets/splash/onboarding/screen3.png",
    "assets/splash/onboarding/screen4.png",
  ];

  void nextPage() {
    if (currentPage < images.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND IMAGES
          PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (i) => setState(() => currentPage = i),
            itemBuilder: (_, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          /// 🔴 SKIP — SADECE 1-2-3 SAYFALARDA
          if (currentPage < images.length - 1)
            Positioned(
              top: 50,
              right: 20,
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushReplacementNamed(context, "/home"),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.redAccent,
                        blurRadius: 18,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

          /// 🟢 NEXT / LET'S GO
          Positioned(
            bottom: 50,
            right: 20,
            child: GestureDetector(
              onTap: nextPage,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 28, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.greenAccent,
                      blurRadius: 22,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Text(
                  currentPage == images.length - 1
                      ? "LET'S GO!"
                      : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
