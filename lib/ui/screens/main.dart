import 'package:flutter/material.dart';
import 'package:kiddo_rewards/ui/screens/splash_screen.dart';
import 'package:kiddo_rewards/ui/screens/onboarding_flow.dart';
import 'package:kiddo_rewards/ui/screens/home_screen.dart';

void main() {
  runApp(const KiddoRewardsApp());
}

class KiddoRewardsApp extends StatelessWidget {
  const KiddoRewardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kiddo Rewards',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Poppins',
      ),

      /// İlk açılan ekran
      initialRoute: '/',

      /// ROUTES BURADA – YERİ TAMAMEN DOĞRU
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingFlow(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
