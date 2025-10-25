import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/theme_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1E26),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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

              Expanded(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    itemCount: 5,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xff252A34),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'اليوم - 7:00 صباحا',
                                    style: TextStyle(
                                      color: ThemeColors.thirdColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'ترقب أقوى وأفضل حدث بالشرق الأوسط',
                                    style: TextStyle(
                                      color: ThemeColors.secondaryColor,
                                      fontSize: 15,
                                      height: 1.3,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: ThemeColors.fourthColor,
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppAssets.ring,
                                  width: 22,
                                  height: 22,
                                  colorFilter: ColorFilter.mode(
                                    ThemeColors.secondaryColor,
                                    BlendMode.srcIn,
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
