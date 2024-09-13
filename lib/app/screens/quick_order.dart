// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../widgets/elevated_button.dart';
import 'cart/order_placed.dart';
import 'cart/widget/alertpopup.dart';
import 'cart/widget/order_summary.dart';
import 'cart/widget/payment_options.dart';
import 'cart/widget/small_card.dart';
import 'cart/widget/timecard.dart';

class QuickOrderScreen extends StatelessWidget {
  const QuickOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Quick Order",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableCard(
                title: 'Select your items',
                leadingIcon: Icons.calendar_month_rounded,
                trailingIcon: Icons.arrow_circle_down_rounded,
                backgroundColor: Colors.blue[100],
                leadingIconColor: Colors.redAccent,
                onTrailingIconPressed: () {
                  // Define what happens when the trailing icon is pressed
                  print('Trailing icon pressed!');
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Collection Time",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              GestureDetector(
                onTap: () => showDatepickerPopup(context),
                child: const TimeCard(
                  date: 'August 27, Tuesday',
                  time: '1.00 PM - 3.00 PM',
                  icon: Icons.local_shipping,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Delivery Time",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              GestureDetector(
                onTap: () => showDatepickerPopup(context),
                child: const TimeCard(
                  date: 'August 28, Wednesday',
                  time: '5.00 PM - 7.00 PM',
                  icon: Icons.people,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Select A Payment Method',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Please Select a payment method to continue',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              const PaymentOption(
                label: 'Cash On Delivery',
                isSelected: true,
              ),
              const PaymentOption(
                label: 'Credit / Debit Card',
                isSelected: false,
              ),
              const PaymentOption(
                label: 'Wallet Payment',
                isSelected: false,
              ),
              const SizedBox(height: 24),
              Text(
                'Order Summary',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 16),
              const OrderSummaryItem(
                label: 'Items Total',
                value: '40.00 QAR',
              ),
              const OrderSummaryItem(
                label: 'Delivery Fee',
                value: 'Free',
                valueColor: Colors.green,
              ),
              const Divider(height: 32),
              const OrderSummaryItem(
                label: 'Total',
                value: '40.00 QAR',
                isBold: true,
              ),
              const SizedBox(height: 30),
              GradientElevatedButton(
                text: 'Place Order',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderConfirmedScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
