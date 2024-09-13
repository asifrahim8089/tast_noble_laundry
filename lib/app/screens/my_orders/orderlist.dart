import 'package:flutter/material.dart';
import 'order_card.dart';

class OrderList extends StatelessWidget {
  final bool fromPast;
  final bool fromSchedule;
  const OrderList(
      {super.key, required this.fromPast, required this.fromSchedule});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        OrderCard(
          referenceNo: '895647',
          orderId: '#58469',
          date: 'August 28, Wednesday',
          status: OrderStatus.confirmed,
          isfromPast: fromPast,
          isfromSchedule: fromSchedule,
        ),
        OrderCard(
          referenceNo: '896859',
          orderId: '#98432',
          date: 'July 18, Tuesday',
          status: OrderStatus.pending,
          isfromPast: fromPast,
          isfromSchedule: fromSchedule,
        ),
        OrderCard(
          referenceNo: '89862',
          orderId: '#86796',
          date: 'June 08, Wednesday',
          status: OrderStatus.completed,
          isfromPast: fromPast,
          isfromSchedule: fromSchedule,
        ),
      ],
    );
  }
}
