import 'package:flutter/material.dart';
import 'package:tickets_demo/core/theme_colors.dart';

class CustomSearchWidget extends StatefulWidget {
  CustomSearchWidget({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  _CustomSearchWidgetState createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      textDirection: TextDirection.rtl,
      style: TextStyle(color: ThemeColors.thirdColor),
      decoration: InputDecoration(
        hintText: "البحث عن حدث",
        hintTextDirection: TextDirection.rtl,
        labelStyle: TextStyle(color: ThemeColors.secondaryColor),
        suffixIcon: Icon(Icons.search),
        suffixStyle: TextStyle(fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ThemeColors.secondaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.thirdColor, width: .5),
        ),
      ),
    );
  }
}
