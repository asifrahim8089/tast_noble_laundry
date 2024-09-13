import 'package:flutter/material.dart';

import '../screens/address/address_screen.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String address;
  final String? addnewaddress;
  final IconData icon;
  final Color iconColor;
  final Color cardColor;
  final bool isDefault;
  final bool canSetDefault;
  final VoidCallback onEdit;
  final VoidCallback? onSetDefault;

  const AddressCard({
    super.key,
    required this.title,
    required this.address,
    this.addnewaddress,
    required this.icon,
    required this.iconColor,
    required this.cardColor,
    this.isDefault = false,
    this.canSetDefault = false,
    required this.onEdit,
    this.onSetDefault,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (isDefault) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '(Default)',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ),
                ],
                const Spacer(),
                Row(
                  children: [
                    if (canSetDefault && !isDefault) ...[
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: onSetDefault,
                        child: Row(
                          children: [
                            const Icon(Icons.radio_button_unchecked,
                                size: 18, color: Colors.blue),
                            const SizedBox(width: 4),
                            Text(
                              'Set as default',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: onEdit,
                      child: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              address,
              style: TextStyle(color: Colors.grey[600]),
            ),
            if ((addnewaddress ?? "").isNotEmpty) ...[
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddressListScreen(),
                    ),
                  );
                },
                child: Text(
                  addnewaddress ?? "",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
