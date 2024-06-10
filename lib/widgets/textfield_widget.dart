import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? Function(String?) validator;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData icon;
  final String hintText;
  const TextFieldWidget({
    super.key,
    required this.validator,
    required this.controller,
    required this.obscureText,
    required this.keyboardType,
    required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: Icon(icon),
        hintText: hintText,
      ),
    );
  }
}
