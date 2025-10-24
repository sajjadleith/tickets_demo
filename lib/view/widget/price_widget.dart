import 'package:flutter/material.dart';
import 'package:tickets_demo/core/theme_colors.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.title, required this.price});
  final String title;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            price.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ThemeColors.secondaryColor,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ThemeColors.thirdColor,
            ),
          ),
        ],
      ),
    );
  }
}
