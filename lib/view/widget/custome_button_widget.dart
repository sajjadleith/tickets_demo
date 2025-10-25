import 'package:flutter/material.dart';
import 'package:tickets_demo/core/theme_colors.dart';

class CustomeButtonWidget extends StatelessWidget {
  const CustomeButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeColors.goldColor,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CustomeButtonBlack extends StatefulWidget {
  CustomeButtonBlack({Key? key, required this.onPressed, required this.title})
    : super(key: key);
  final String title;
  final VoidCallback onPressed;
  @override
  _CustomeButtonBlackState createState() => _CustomeButtonBlackState();
}

class _CustomeButtonBlackState extends State<CustomeButtonBlack> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeColors.primaryColor,
        foregroundColor: ThemeColors.goldColor,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.title,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CustomButtonWidgetRed extends StatefulWidget {
  const CustomButtonWidgetRed({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final VoidCallback onPressed;
  final String title;

  @override
  _CustomButtonWidgetRedState createState() => _CustomButtonWidgetRedState();
}

class _CustomButtonWidgetRedState extends State<CustomButtonWidgetRed> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeColors.redColor,
        foregroundColor: ThemeColors.secondaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.title,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}
