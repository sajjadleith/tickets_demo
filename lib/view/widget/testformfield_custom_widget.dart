import 'package:flutter/material.dart';
import 'package:tickets_demo/core/theme_colors.dart';

class TestformfieldCustomWidget extends StatefulWidget {
  const TestformfieldCustomWidget({
    super.key,
    required this.controller,
    required this.validator,
    required this.title,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String title;

  @override
  _TestformfieldCustomWidgetState createState() =>
      _TestformfieldCustomWidgetState();
}

class _TestformfieldCustomWidgetState extends State<TestformfieldCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textDirection: TextDirection.rtl,
      style: TextStyle(color: ThemeColors.secondaryColor),
      decoration: InputDecoration(
        hintText: widget.title,
        hintTextDirection: TextDirection.rtl,
        labelStyle: TextStyle(color: ThemeColors.secondaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ThemeColors.secondaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.secondaryColor, width: .5),
        ),
      ),
      validator: widget.validator,
    );
  }
}
