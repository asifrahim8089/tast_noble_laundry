import 'package:flutter/material.dart';
import 'package:ice_laundry/auth/otp_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../app/widgets/circleflag.dart';
import '../app/widgets/elevated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedCountryCode = 'QA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login Account",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Hello! Welcome to the account",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[500],
                    ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleFlag(countryCode: selectedCountryCode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .4,
                  child: Image.asset(
                    "assets/images/login.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Phone Number",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[500],
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              IntlPhoneField(
                disableLengthCheck: true,
                decoration: const InputDecoration(
                  // Customizing the border radius
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 8), // Adjust padding
                ),
                initialCountryCode: selectedCountryCode,
                onChanged: (phone) {},
                onCountryChanged: (country) {
                  setState(() {
                    selectedCountryCode = country.code;
                  });
                },
                // Position the dropdown icon to the right
                dropdownIconPosition: IconPosition.trailing,
                dropdownIcon: const Icon(Icons.arrow_drop_down),
                flagsButtonPadding: const EdgeInsets.all(
                    5), // Add padding around the flag button
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                // Custom dropdown builder to adjust flag, icon, and country code layout
                dropdownTextStyle: const TextStyle(
                  fontSize: 14,
                ),
                flagsButtonMargin: const EdgeInsets.all(
                    1.0), // margin between flag and text field
                showDropdownIcon: true,
              ),
              const SizedBox(
                height: 10,
              ),
              GradientElevatedButton(
                text: 'Request OTP',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  "Do you have any issues in login?",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[500],
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo/whatsapp.png",
                    height: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Contact Us",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
