import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Color? backgroundColor;
  final Color? leadingIconColor;
  final VoidCallback onTrailingIconPressed;

  const ReusableCard({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.trailingIcon,
    this.backgroundColor = const Color(0xFFB3E5FC), // Default color
    this.leadingIconColor = Colors.redAccent,
    required this.onTrailingIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  leadingIcon,
                  color: leadingIconColor,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            IconButton(
              onPressed: onTrailingIconPressed,
              icon: Icon(trailingIcon),
            ),
          ],
        ),
      ),
    );
  }
}
