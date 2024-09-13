import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ice_laundry/app/widgets/elevated_button.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/bottom_nav.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_jbrw3hcz.json',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              Text(
                'Order Confirmed',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your Order has been confirmed',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 48),
              // Custom continue button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: GradientElevatedButton(
                  text: "Done",
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigation(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Scattered dots background
class ScatteredDotsBackground extends StatelessWidget {
  const ScatteredDotsBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DotsPainter(),
      child: Container(),
    );
  }
}

class DotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF64B5F6).withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final random = Random();

    for (int i = 0; i < 20; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), 3, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
