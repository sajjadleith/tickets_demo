import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tickets_demo/core/theme_colors.dart';

class ExpiryDatePicker extends StatefulWidget {
  const ExpiryDatePicker({super.key});

  @override
  State<ExpiryDatePicker> createState() => _ExpiryDatePickerState();
}

class _ExpiryDatePickerState extends State<ExpiryDatePicker> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.dark(
                  primary: const Color(0xFFFFC107), // لون الزر
                  onPrimary: ThemeColors.primaryColor,
                  surface: const Color(0xFF1E1E1E),
                  onSurface: Colors.white,
                ),
                dialogTheme: DialogThemeData(
                  backgroundColor: const Color(0xFF121212),
                ),
              ),
              child: child!,
            );
          },
        );
        if (picked != null) {
          setState(() {
            selectedDate = picked;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: ThemeColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withOpacity(0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null
                  ? DateFormat('dd MMM yyyy').format(selectedDate!)
                  : "Select date",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade300),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.grey.shade400, size: 26),
          ],
        ),
      ),
    );
  }
}
