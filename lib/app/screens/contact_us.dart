import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: Image.asset(
            'assets/images/contact_us.jpg',
          ),
        ),
      ),
    );
  }
}
