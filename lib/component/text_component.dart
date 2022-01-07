import 'package:flutter/material.dart';

class textForm extends StatelessWidget {
  final bool obs;
  final TextEditingController controller;
  final String label;
  const textForm({
    Key? key,
    required this.label,
    required this.obs,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Harus diisi";
        } else {
          return null;
        }
      },
      obscureText: obs,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: label),
    );
  }
}
