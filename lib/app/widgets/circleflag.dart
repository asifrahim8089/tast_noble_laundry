import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class CircleFlag extends StatelessWidget {
  final String countryCode;

  const CircleFlag({super.key, required this.countryCode});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CountryFlag.fromCountryCode(
        countryCode,
        height: 30,
        width: 30,
      ),
    );
  }
}
