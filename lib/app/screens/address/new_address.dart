import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ice_laundry/app/widgets/elevated_button.dart';

class AddressInputScreen extends StatefulWidget {
  const AddressInputScreen({super.key});

  @override
  State<AddressInputScreen> createState() => _AddressInputScreenState();
}

class _AddressInputScreenState extends State<AddressInputScreen> {
  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(25.2519, 51.5353),
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMapSection(),
          Positioned(
            left: 5,
            top: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5), // Add padding around the image
                  child: Image.asset(
                    "assets/images/arrow.png",
                    height: 25,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 5,
            right: 5,
            bottom: 16,
            child: GradientElevatedButton(
              text: "Add Address",
              onPressed: () => _showAddressForm(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return GoogleMap(
      initialCameraPosition: _initialPosition,
      onMapCreated: (GoogleMapController controller) {},
      // Add any additional Google Maps options here if needed
    );
  }

  void _showAddressForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.2,
          maxChildSize: 0.8,
          expand: false,
          builder: (_, controller) {
            return SingleChildScrollView(
              controller: controller,
              child: _buildForm(context),
            );
          },
        );
      },
    );
  }

  Widget _buildForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          _buildInputField('Place Name*', 'Enter Place name'),
          const SizedBox(height: 16),
          _buildInputField('Landmark', 'Shops / Malls / School'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildInputField('Building Number*', 'Building No'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildInputField('Zone*', 'Zone No'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildInputField('Street*', 'Road name Area'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildInputField('Unit*', 'Unit No'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          GradientElevatedButton(
            text: "Save Address",
            onPressed: () {
              // Implement save address logic here
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black38),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}
