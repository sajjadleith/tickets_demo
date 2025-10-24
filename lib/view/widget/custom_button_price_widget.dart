import 'package:flutter/material.dart';
import 'package:tickets_demo/core/theme_colors.dart';

class CustomButtonPriceWidget extends StatefulWidget {
  const CustomButtonPriceWidget({super.key, required this.total});
  final int total;

  @override
  _CustomButtonPriceWidgetState createState() =>
      _CustomButtonPriceWidgetState();
}

class _CustomButtonPriceWidgetState extends State<CustomButtonPriceWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFDF5D6),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        splashColor: ThemeColors.primaryColor.withOpacity(0.1),
        highlightColor: ThemeColors.primaryColor.withOpacity(0.05),
        onTap: () {
          // كود الدفع هنا
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.total.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.primaryColor,
                ),
              ),
              Container(
                width: 1,
                height: 24,
                color: ThemeColors.primaryColor.withOpacity(0.7),
              ),
              Text(
                "دفع الآن",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
