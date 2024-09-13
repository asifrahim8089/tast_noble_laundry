import 'package:flutter/material.dart';
import 'package:ice_laundry/app/screens/cart/checkout_screen.dart';

import '../../widgets/cart_item_card.dart';
import '../../widgets/elevated_button.dart';
import 'widget/small_card.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      'image': 'assets/images/category_images/trd2.png',
      'name': 'Qatari Thobe',
      'cleaningMethod': 'Dry Clean',
      'foldingMethod': 'Hanger',
      'price': 10.00,
    },
    {
      'image': 'assets/images/category_images/trd3.png',
      'name': 'Shimagh',
      'cleaningMethod': 'Wash & Iron',
      'foldingMethod': 'Rectangle Fold',
      'price': 20.00,
    },
  ];

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(
      0.0,
      (sum, item) => sum + item['price'],
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) => CartItem(
                image: cartItems[index]['image'],
                name: cartItems[index]['name'],
                cleaningMethod: cartItems[index]['cleaningMethod'],
                price: cartItems[index]['price'],
                additionalOptions: const ['Oud Musk', 'Hanger'],
                quantity: 1,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ReusableCard(
                title: 'Apply Voucher',
                leadingIcon: Icons.card_giftcard_outlined,
                trailingIcon: Icons.arrow_circle_right_outlined,
                backgroundColor: Colors.blue[100],
                leadingIconColor: Colors.redAccent,
                onTrailingIconPressed: () {},
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total:',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${total.toStringAsFixed(2)} QAR',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GradientElevatedButton(
                text: 'Check Out',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
