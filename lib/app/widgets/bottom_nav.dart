// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../screens/quick_order.dart';
import '../screens/home_screen.dart';
import '../screens/my_orders/my_orders.dart';
import '../screens/my_profile.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    QuickOrderScreen(),
    OrderListScreen(),
    MyProfileScreen(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTappedBar,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Quick Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}
