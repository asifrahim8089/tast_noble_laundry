import 'package:flutter/material.dart';

import '../../models/item_model.dart';
import '../category_display_card.dart';
import '../display_details.dart';

class TraditionalTab extends StatelessWidget {
  const TraditionalTab({super.key});

  @override
  Widget build(BuildContext context) {
    const firstPartItemsCount = 6;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // First part with 2 rows (6 items)
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = items[index];
                return ItemCard(
                  image: item.image,
                  name: item.name,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ItemDetails(image: item.image, name: item.name),
                      ),
                    );
                    // showModalBottomSheet(
                    //   context: context,
                    //   isScrollControlled:
                    //       true, // Allows control of modal height
                    //   builder: (context) {
                    //     return FractionallySizedBox(
                    //       heightFactor: 0.9, // 90% of screen height
                    //       child: ItemDialog(
                    //         image: item.image,
                    //         name: item.name,
                    //       ),
                    //     );
                    //   },
                    // );
                  },
                );
              },
              childCount: firstPartItemsCount,
            ),
          ),
          // Full-width Container
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue[400],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/star.png",
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'QUICK ORDER',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    // Adjust spacing around the divider
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      color: Colors.white,
                      height: 50,
                      child: const VerticalDivider(
                        width: 2,
                        thickness: 2,
                        color: Colors.white,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'We will finish the laundry within 1 day',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Remaining items below the full-width Container
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // Adjust index for the second SliverGrid
                final item = items[index + firstPartItemsCount];
                return ItemCard(
                  image: item.image,
                  name: item.name,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ItemDetails(image: item.image, name: item.name),
                      ),
                    );
                    // showModalBottomSheet(
                    //   context: context,
                    //   isScrollControlled: true,
                    //   builder: (context) {
                    //     return FractionallySizedBox(
                    //       heightFactor: 0.9,
                    //       child: ItemDialog(
                    //         image: item.image,
                    //         name: item.name,
                    //       ),
                    //     );
                    //   },
                    // );
                  },
                );
              },
              childCount: items.length - firstPartItemsCount,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 150.0, // Height of the SizedBox
            ),
          ),
        ],
      ),
    );
  }
}
