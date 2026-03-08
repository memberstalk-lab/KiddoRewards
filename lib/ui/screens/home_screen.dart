import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kiddo Rewards'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash/branding/kiddo_256.png',
              width: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Kiddo Rewards!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Start earning stars and unlocking rewards',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
