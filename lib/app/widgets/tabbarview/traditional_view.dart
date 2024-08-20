import 'package:flutter/material.dart';

import '../../models/item_model.dart';
import '../category_display_card.dart';
import '../display_details.dart';

class TraditionalTab extends StatelessWidget {
  const TraditionalTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          childAspectRatio: 1.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemCard(
            image: item.image,
            name: item.name,
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled:
                    true, // Allows you to control the height of the modal
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.9, // 80% of the screen height
                    child: ItemDialog(
                      image: item.image,
                      name: item.name,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
