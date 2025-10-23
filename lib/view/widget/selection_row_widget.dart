import 'package:flutter/material.dart';
import 'package:tickets_demo/core/theme_colors.dart';

class SelectionRowWidget
    extends
        StatelessWidget {
  const SelectionRowWidget({
    super.key,
    required this.color,
    required this.title,
  });
  final Color color;
  final String title;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: ThemeColors.thirdColor,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: BoxBorder.all(
              color: Colors.white,
            ),
            color: color,
          ),
        ),
      ],
    );
  }
}
