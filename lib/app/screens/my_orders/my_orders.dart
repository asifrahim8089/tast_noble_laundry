import 'package:flutter/material.dart';
import '../cart/cart_screen.dart';
import 'orderlist.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "My Orders",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.grey),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.all(5),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Image.asset(
                    "assets/images/shopping-cart.png",
                    height: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue.withOpacity(0.1),
              ),
              tabs: [
                Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.local_shipping),
                        SizedBox(width: 3),
                        Text('Current'),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.local_shipping),
                        SizedBox(width: 3),
                        Text('Past Orders'),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.local_shipping),
                        SizedBox(width: 3),
                        Text('Schedules'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  OrderList(
                    fromPast: false,
                    fromSchedule: false,
                  ),
                  OrderList(
                    fromPast: true,
                    fromSchedule: false,
                  ),
                  OrderList(
                    fromPast: false,
                    fromSchedule: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
