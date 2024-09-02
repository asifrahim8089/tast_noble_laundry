import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../app/widgets/bottom_nav.dart';
import '../app/widgets/elevated_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "OTP",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .35,
                  child: Image.asset(
                    "assets/images/otpverify.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Verification Code",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "We have sent the phone verification to yourphone number.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[500],
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "+974 885 3654",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.grey[500],
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.mode_edit_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              _pinInputForm(),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GradientElevatedButton(
                  text: 'Submit',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigation(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.white, // Set your desired background color
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), // Shadow color
          spreadRadius: 2, // Spread radius
          blurRadius: 2, // Blur radius
          offset: const Offset(0, 3), // Changes the position of the shadow
        ),
      ],
    ),
  );
  Widget _pinInputForm() {
    return Form(
      key: formKey,
      child: Pinput(
        defaultPinTheme: defaultPinTheme,
        validator: (value) {
          return null;
        },
        onCompleted: (pin) {
          print('Success: $pin');
        },
        errorBuilder: (errorText, pin) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Text(
                errorText ?? "",
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}
