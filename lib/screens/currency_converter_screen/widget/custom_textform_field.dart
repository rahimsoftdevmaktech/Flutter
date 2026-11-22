import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.textEditingController});
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        labelText: "Please enter amount",
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(Icons.monetization_on_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Please enter an amount";
        }

        if (double.tryParse(value) == null) {
          return "It's not a valid number";
        }

        return null;
      },
    );
  }
}
