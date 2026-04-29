
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.title,
    this.errorText,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    this.editable = true,
    this.onChanged,
    this.prefixIcon,
  });

  final TextEditingController? controller;
  final String? title;
  final String? errorText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool editable;
  final ValueChanged<String>? onChanged;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: title,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(100),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      obscureText: obscureText,
      validator: validator,
      enabled: editable,
    );
  }
}