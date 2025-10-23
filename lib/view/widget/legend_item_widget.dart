import 'package:flutter/material.dart';

class LegendItem
    extends
        StatelessWidget {
  final String status;
  final String label;

  const LegendItem({
    super.key,
    required this.status,
    required this.label,
  });

  Color seatColor(
    String s,
  ) {
    switch (s) {
      case "reserved":
        return const Color(
          0xFFDF6A66,
        );
      case "selected":
        return const Color(
          0xFFF7F6E6,
        );
      default:
        return Colors.transparent;
    }
  }

  Border? seatBorder(
    String s,
  ) {
    if (s ==
            "available" ||
        s ==
            "empty") {
      return Border.all(
        color: Colors.grey.shade700,
        width: 2,
      );
    }
    return null;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final color =
        (status ==
                "available" ||
            status ==
                "empty")
        ? Colors.transparent
        : seatColor(
            status,
          );
    final border = seatBorder(
      status,
    );

    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            border: border,
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          label,
        ),
      ],
    );
  }
}
