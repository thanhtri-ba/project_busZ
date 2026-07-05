import 'package:flutter/material.dart';
import 'package:busz/core/widgets/base/base_input.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.controller,
    this.hintText = 'Search...',
    this.onChanged,
    this.onSubmitted,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      controller: controller,
      hintText: hintText,
      prefixIcon: Icons.search_rounded,
      suffixIcon: suffixIcon,
      textInputAction: TextInputAction.search,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
