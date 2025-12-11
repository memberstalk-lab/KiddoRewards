import 'package:flutter/material.dart';

class OnboardButtons extends StatelessWidget {
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final bool isLastPage;

  const OnboardButtons({
    super.key,
    required this.onSkip,
    required this.onNext,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          /// 🔴 SKIP (RED NEON GLOW)
          _neonButton(
            text: "Skip",
            baseColor: Colors.redAccent,
            glowColor: Colors.redAccent.shade100,
            onTap: onSkip,
          ),

          /// 🟢 NEXT / START (GREEN NEON GLOW)
          _neonButton(
            text: isLastPage ? "Start" : "Next",
            baseColor: Colors.greenAccent.shade700,
            glowColor: Colors.greenAccent.shade100,
            onTap: onNext,
          ),
        ],
      ),
    );
  }

  /// ✨ NEON BUTTON WIDGET
  Widget _neonButton({
    required String text,
    required Color baseColor,
    required Color glowColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            /// Yumuşak NEON Glow
            BoxShadow(
              color: glowColor.withOpacity(0.9),
              blurRadius: 25,
              spreadRadius: 5,
            ),

            /// Dışa vurgu
            BoxShadow(
              color: glowColor.withOpacity(0.6),
              blurRadius: 40,
              spreadRadius: 15,
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.white,
                blurRadius: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
