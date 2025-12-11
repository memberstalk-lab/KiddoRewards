import 'package:flutter/material.dart';
import 'ui/screens/splash_screen.dart';
import 'ui/screens/onboarding_flow.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // İlk açılan ekran
      home: const SplashScreen(),

      // Navigation routes
      routes: {
        '/onboarding': (context) => const OnboardingFlow(),
      },
    );
  }
}
