import 'package:flutter/material.dart';

import '../widgets/tabbarview/traditional_view.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 80.0,
          leading: Image.asset(
            "assets/logo/logo.jpg",
          ),
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Afternoon",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "Guest",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_rounded,
              ),
            ),
          ],
          bottom: const TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: [
              Tab(text: "Traditional"),
              Tab(text: "Tops"),
              Tab(text: "Bottoms"),
              Tab(text: "Suits"),
              Tab(text: "Home"),
              Tab(text: "Accessories"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TraditionalTab(),
            Center(child: Text("Tops")),
            Center(child: Text("Bottoms")),
            Center(child: Text("Suits")),
            Center(child: Text("Home")),
            Center(child: Text("Accessories")),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Handle quick order action
          },
          label: const Text(
            "Quick Order",
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(
            Icons.flash_on,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue[900],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
