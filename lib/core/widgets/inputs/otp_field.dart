import 'package:flutter/material.dart';
import 'package:busz/core/theme/app_radius.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    this.controller,
    this.onChanged,
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 60,
      child: TextFormField(
        controller: controller,
        autofocus: autofocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(borderRadius: AppRadius.input),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
