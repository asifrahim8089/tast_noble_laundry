import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String image;
  final String name;
  final String cleaningMethod;
  final List<String> additionalOptions;
  final double price;
  final int quantity;

  const CartItem({
    super.key,
    required this.image,
    required this.name,
    required this.cleaningMethod,
    required this.additionalOptions,
    required this.price,
    this.quantity = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(image,
                    width: 80, height: 80, fit: BoxFit.cover),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        const Icon(Icons.delete_outline, color: Colors.grey),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      cleaningMethod,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: additionalOptions
                          .map(
                            (option) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  option == 'Oud Musk'
                                      ? Icons.local_drink_outlined
                                      : Icons.shopping_basket_rounded,
                                  size: 16,
                                  color: Colors.green[600],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  option,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'qty',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '$quantity',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Icon(Icons.arrow_drop_down, size: 16),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${price.toStringAsFixed(2)} QAR',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
