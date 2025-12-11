import 'package:flutter/material.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<String> pages = [
    'assets/splash/onboarding/onboard1.png',
    'assets/splash/onboarding/onboard2.png',
    'assets/splash/onboarding/onboard3.png',
    'assets/splash/onboarding/onboard4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (i) {
              setState(() => currentIndex = i);
            },
            itemCount: pages.length,
            itemBuilder: (_, index) {
              return Image.asset(
                pages[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          // Skip Button
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                // TODO: Navigate to your app home/dashboard
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          // Bottom Continue Button
          Positioned(
            bottom: 50,
            left: 40,
            right: 40,
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex == pages.length - 1) {
                  // LAST PAGE → TODO: NAVIGATE HOME
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                currentIndex == pages.length - 1 ? "Finish" : "Continue",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
