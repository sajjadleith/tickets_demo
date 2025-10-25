import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/view/widget/custome_button_widget.dart';

class ShowBottomSheetWidget {
  static void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 450,
              height: 400,
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: ThemeColors.goldColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 80),
                  Text(
                    "تمت عملية الشراء بنجاح",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: ThemeColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Text(
                    "يرجى التأكد من التذكرة واستخدامها عند الدخول للحدث لقرائتها من قبل الجهاز المتخصص",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 70),
                  CustomeButtonBlack(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.ticketPage);
                    },
                    title: "مشاهدة التذكرة",
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: 112,
                height: 112,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeColors.goldColor,
                  border: Border.all(color: Colors.black, width: 4),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.sheild,
                    width: 39,
                    height: 46,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
