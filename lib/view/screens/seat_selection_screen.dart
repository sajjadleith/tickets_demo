import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/view/screens/seats_page.dart';
import 'package:tickets_demo/view/widget/custome_button_widget.dart';
import 'package:tickets_demo/view/widget/legend_item_widget.dart';
import 'package:tickets_demo/view/widget/screen_arc_widget.dart';
import 'package:tickets_demo/view/widget/selection_row_widget.dart';

class SeatSelectionScreen extends StatefulWidget {
  SeatSelectionScreen({Key? key}) : super(key: key);

  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  int selectedCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 22, right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        alignment: Alignment.center,
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SvgPicture.asset(
                          AppAssets.arrowBack,
                          colorFilter: ColorFilter.mode(
                            ThemeColors.secondaryColor,
                            BlendMode.srcIn,
                          ),
                          width: 18,
                          height: 18,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Text(
                      "اختيار المقاعد",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.secondaryColor,
                      ),
                    ),
                    Text(""),
                  ],
                ),
                SizedBox(height: 25),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text.rich(
                    TextSpan(
                      text: "عدد التذاكر المختارة:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ThemeColors.thirdColor,
                      ),
                      children: [
                        TextSpan(
                          text: selectedCount.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ScreenArc(),
                SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: SeatsPage(
                    onSelectionChanged: (count) {
                      selectedCount = count;
                      setState(() {});
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SelectionRowWidget(
                      title: "المختارة",
                      color: ThemeColors.secondaryColor,
                    ),
                    SelectionRowWidget(
                      title: "محجوزة",
                      color: Color(0xFFDF6A66),
                    ),
                    SelectionRowWidget(
                      title: "متاحة",
                      color: Colors.transparent,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Text(
                    "معلومات عن المكان",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text.rich(
                    TextSpan(
                      text:
                          "يتميز الحدث بحضور المطربين والمشهورين العرب لحضور هذا الحدث عليك شراء تذكرة وتحديد المقعد الخاص بك ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ThemeColors.thirdColor,
                      ),
                      children: [
                        TextSpan(
                          text: "قراءة المزيد",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 73),
                SizedBox(
                  width: double.infinity,
                  child: CustomeButtonWidget(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.checkoutPage,
                        arguments: {"selectedCount": selectedCount},
                      );
                    },
                    title: "شراء تذكرة",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
