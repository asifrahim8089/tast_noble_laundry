import 'package:flutter/material.dart';
import 'order_details.dart';

enum OrderStatus { confirmed, pending, completed }

class OrderCard extends StatelessWidget {
  final String referenceNo;
  final String orderId;
  final String date;
  final OrderStatus status;
  final bool isfromPast;
  final bool isfromSchedule;

  const OrderCard({
    super.key,
    required this.referenceNo,
    required this.orderId,
    required this.date,
    required this.status,
    required this.isfromPast,
    required this.isfromSchedule,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the OrderDetailsScreen when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(
              isfromPast: isfromPast,
              isfromSchedule: isfromSchedule,
            ),
          ),
        );
      },
      child: Card(
        elevation: 0,
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Reference No : $referenceNo',
                      style: const TextStyle(color: Colors.grey)),
                  Text('Order Id : $orderId',
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 8),
              const Text('Order Placed on',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(date, style: const TextStyle(color: Colors.grey)),
                  _buildStatusChip(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip() {
    Color color;
    String text;
    switch (status) {
      case OrderStatus.confirmed:
        color = Colors.blue;
        text = 'Order Confirmed';
        break;
      case OrderStatus.pending:
        color = Colors.yellow;
        text = 'Pending';
        break;
      case OrderStatus.completed:
        color = Colors.green;
        text = 'Completed';
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: status == OrderStatus.pending ? Colors.black : Colors.white),
      ),
    );
  }
}
