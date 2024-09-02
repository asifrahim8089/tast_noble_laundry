// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ice_laundry/app/screens/address/new_address.dart';

import '../../widgets/address_card.dart';
import '../../widgets/elevated_button.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          "Choose Address",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            AddressCard(
              title: 'Home Address',
              address:
                  'C Ring Road, Al Darwish Building, Second Floor, PO-Box: 31034, Doha - Qatar',
              icon: Icons.home,
              iconColor: Colors.red,
              isDefault: true,
              onEdit: () => print('Edit Home Address'),
              cardColor: Colors.blue[100]!,
            ),
            AddressCard(
              title: 'Office Address',
              address:
                  'Farwa Road, Al Kabir Building, Third Floor, PO-Box: 31038, Doha - Qatar',
              icon: Icons.business,
              iconColor: Colors.blue,
              canSetDefault: true,
              onEdit: () => print('Edit Office Address'),
              onSetDefault: () => print('Set Office as default'),
              cardColor: Colors.grey[300]!,
            ),
            AddressCard(
              title: 'Other Address',
              address:
                  'Al mubark Road, Al Kabir Building, First Floor, PO-Box: 31038, Doha - Qatar',
              icon: Icons.location_on,
              iconColor: Colors.green,
              canSetDefault: true,
              onEdit: () => print('Edit Other Address'),
              onSetDefault: () => print('Set Other as default'),
              cardColor: Colors.grey[300]!,
            ),
            const SizedBox(height: 30),
            GradientElevatedButton(
              text: 'Add New Address',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddressInputScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
