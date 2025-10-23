import 'package:flutter/material.dart';
import 'package:tickets_demo/core/theme_colors.dart';

class PhoneWidget extends StatefulWidget {
  PhoneWidget({
    super.key,
    required this.phoneController,
    required this.formKey,
    required this.phoneValidation,
  });
  final TextEditingController phoneController;
  final GlobalKey formKey;
  String? Function(String?) phoneValidation;
  @override
  State<PhoneWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: AlignmentGeometry.centerRight,
            child: Text(
              "رقم الهاتف",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,

            child: TextFormField(
              controller: widget.phoneController,
              keyboardType: TextInputType.number,
              textDirection: TextDirection.rtl,
              style: TextStyle(color: ThemeColors.secondaryColor),
              decoration: InputDecoration(
                hintText: "اكتب رقم الهاتف",
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
                  borderSide: BorderSide(
                    color: ThemeColors.secondaryColor,
                    width: .5,
                  ),
                ),
              ),
              validator: widget.phoneValidation,
            ),
          ),
        ],
      ),
    );
  }
}
