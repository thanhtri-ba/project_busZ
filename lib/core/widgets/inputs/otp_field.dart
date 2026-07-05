import 'package:flutter/material.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: '•',
        border: OutlineInputBorder(),
      ),
    );
  }
}
