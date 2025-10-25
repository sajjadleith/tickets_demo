import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/view/widget/custome_button_widget.dart';

class DeactivateAccountScreen extends StatelessWidget {
  const DeactivateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rules = [
      "يرجى التأكد من التذكرة واستخدامها عند الدخول للحدث لقراءتها من قبل الجهاز المتخصص",
      "يرجى التأكد من التذكرة واستخدامها عند الدخول للحدث لقراءتها من قبل الجهاز المتخصص",
      "يرجى التأكد من التذكرة واستخدامها عند الدخول للحدث لقراءتها من قبل الجهاز المتخصص",
      "يرجى التأكد من التذكرة واستخدامها عند الدخول للحدث لقراءتها من قبل الجهاز المتخصص",
      "يرجى التأكد من التذكرة واستخدامها عند الدخول للحدث لقراءتها من قبل الجهاز المتخصص",
      "يرجى التأكد من التذكرة واستخدامها عند الدخول للحدث لقراءتها من قبل الجهاز المتخصص",
      "يرجى التأكد من التذكرة واستخدامها عند الدخول للحدث لقراءتها من قبل الجهاز المتخصص",
      "يرجى التأكد من التذكرة واستخدامها عند الدخول للحدث لقراءتها من قبل الجهاز المتخصص",
      "يرجى التأكد من التذكرة واستخدامها عند الدخول للحدث لقراءتها من قبل الجهاز المتخصص",
    ];

    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "إلغاء تفعيل الحساب",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                ],
              ),

              const SizedBox(height: 20),

              Directionality(
                textDirection: TextDirection.rtl,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: rules.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "• ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                height: 1.5,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                rules[index],
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: ThemeColors.secondaryColor,
                                  fontSize: 14,
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: CustomButtonWidgetRed(
                  onPressed: () {},
                  title: "حذف الحساب نهائيا",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
