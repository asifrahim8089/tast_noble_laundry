import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final bool isfromPast;
  final bool isfromSchedule;
  const OrderDetailsScreen(
      {super.key, required this.isfromPast, required this.isfromSchedule});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
            isfromSchedule ? "Scheduled Order Details" : 'Order Details',
            style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isfromSchedule
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[150],
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.1),
                            // spreadRadius: 1,
                            // blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Reference No : 895647',
                                    style: TextStyle(color: Colors.grey)),
                                Text('Order Id : 58469',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            const Divider(
                              thickness: 0.5,
                            ),
                            Text("Order Scheduled on",
                                style: Theme.of(context).textTheme.titleMedium),
                            Text("Sep 28 ,Saturday",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.grey)),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 10),
              const OrderInfoSection(),
              const SizedBox(height: 24),
              isfromPast || isfromSchedule
                  ? const SizedBox()
                  : const Text('Track your Order',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              isfromPast || isfromSchedule
                  ? const SizedBox()
                  : const OrderTrackingSection(),
              isfromSchedule
                  ? Center(
                      child: Text(
                        "you can edit your schedule at anytime",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    )
                  : const Text(""),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderInfoSection extends StatelessWidget {
  const OrderInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[150],
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            OrderInfoItem(
              icon: 'assets/tracking/orderid.png',
              label: 'Order Id',
              value: '#58469',
            ),
            Divider(
              thickness: 0.5,
            ),
            OrderInfoItem(
              icon: 'assets/tracking/items.png',
              label: 'No. Of Items',
              value: '2',
            ),
            Divider(
              thickness: 0.5,
            ),
            OrderInfoItem(
              icon: 'assets/tracking/date.png',
              label: 'Order date',
              value: '28, August, 12:34 PM',
            ),
            Divider(
              thickness: 0.5,
            ),
            OrderInfoItem(
              icon: 'assets/tracking/delivery.png',
              label: 'Delivery date',
              value: '30, August',
            ),
            Divider(
              thickness: 0.5,
            ),
            OrderInfoItem(
              icon: 'assets/tracking/amountdue.png',
              label: 'Amount Due',
              value: '40.00 QAR',
            ),
          ],
        ),
      ),
    );
  }
}

class OrderInfoItem extends StatelessWidget {
  final String icon;
  final String label;
  final String value;

  const OrderInfoItem(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(icon, width: 24, height: 24),
          const SizedBox(width: 16),
          Expanded(
              child: Text(label,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey[600]))),
          Text(value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey[600])),
        ],
      ),
    );
  }
}

class OrderTrackingSection extends StatelessWidget {
  const OrderTrackingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        OrderTrackingItem(
          icon: 'assets/tracking/confirmed.png',
          status: 'Your Order Confirmed',
          date: 'August 28, Wednesday',
          isCompleted: true,
          isFirst: true,
        ),
        OrderTrackingItem(
          icon: 'assets/tracking/collected.png',
          status: 'Collected',
          date: 'August 29, Thursday',
          isCompleted: true,
        ),
        OrderTrackingItem(
          icon: 'assets/tracking/processing.png',
          status: 'Processing',
          date: 'We are Working on the Laundry',
          isCompleted: false,
          isHighlighted: true,
        ),
        OrderTrackingItem(
          icon: 'assets/tracking/shipping.png',
          status: 'Shipping',
          date: 'Will Ship on 29 August',
          isCompleted: false,
        ),
        OrderTrackingItem(
          icon: 'assets/tracking/delivered.png',
          status: 'Delivery',
          date: 'Deliver On 30 August',
          isCompleted: false,
          isLast: true,
        ),
      ],
    );
  }
}

class OrderTrackingItem extends StatelessWidget {
  final String icon;
  final String status;
  final String date;
  final bool isCompleted;
  final bool isHighlighted;
  final bool isFirst;
  final bool isLast;

  const OrderTrackingItem({
    super.key,
    required this.icon,
    required this.status,
    required this.date,
    this.isCompleted = false,
    this.isHighlighted = false,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? Colors.green
                      : (isFirst ? Colors.green : Colors.grey[300]),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: isCompleted ? Colors.green : Colors.grey[300],
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: isHighlighted
                  ? BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    )
                  : BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(8),
                    ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(icon, width: 24, height: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(status,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(height: 4),
                        Text(date,
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
