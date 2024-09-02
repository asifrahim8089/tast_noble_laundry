import 'package:flutter/material.dart';

class AddToBasketButton extends StatelessWidget {
  final double total;
  final VoidCallback onPressed;

  const AddToBasketButton({
    super.key,
    required this.total,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.zero,
      ),
      child: Container(
        height: 40, // Adjust this value to match the desired button height
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total : ${total.toStringAsFixed(2)} QAR',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Add to basket',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
