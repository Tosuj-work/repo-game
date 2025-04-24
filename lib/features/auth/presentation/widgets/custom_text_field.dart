import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final TextInputType? keyboardType;
  final String? suffix;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? initialValue;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hint,
    this.keyboardType,
    this.suffix,
    this.readOnly = false,
    this.onTap,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly,
        onTap: onTap,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Пожалуйста, заполните это поле';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF03045E)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: InputBorder.none,
          suffixText: suffix,
        ),
        style: const TextStyle(color: Color(0xFF03045E)),
        initialValue: initialValue,
      ),
    );
  }
} 
