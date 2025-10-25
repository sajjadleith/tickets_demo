import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/model/event_model.dart';
import 'package:tickets_demo/view/widget/custome_button_widget.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.end,
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
                      "عرض التذاكر",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.secondaryColor,
                      ),
                    ),
                    Text(""),
                  ],
                ),
                SizedBox(height: 26),
                Text(
                  "معلومات عن التذكرة",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ThemeColors.secondaryColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.right,
                  "يرجى التأكد من التذكرة واستخدامها عند الدخول للحدث لقرائتها من قبل الجهاز المتخصص",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ThemeColors.thirdColor,
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 444,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      reverse: false,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(AppAssets.ticket),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "e-ticket",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: ThemeColors.redColor,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        textDirection: TextDirection.ltr,
                                        "Event:",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.fourthColor,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(eventList[0].name),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Seats",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.fourthColor,
                                        ),
                                      ),
                                      Text(
                                        "c4, c5",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.fourthColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        textDirection: TextDirection.ltr,
                                        "Date:",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.fourthColor,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text("06/09/2021"),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "time",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.fourthColor,
                                        ),
                                      ),
                                      Text(
                                        "01:00 PM",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.fourthColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        textDirection: TextDirection.ltr,
                                        "Location:",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.fourthColor,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Baghdad / Al-mansur Mall",
                                        textScaler: TextScaler.linear(0.76),
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.fourthColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Order",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.fourthColor,
                                        ),
                                      ),
                                      Text(
                                        "1904566",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.fourthColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        textDirection: TextDirection.ltr,
                                        "Payment:",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.fourthColor,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Successful",
                                        textScaler: TextScaler.linear(0.76),
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.fourthColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 70),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: DottedLine(
                                  dashLength: 6,
                                  dashGapLength: 4,
                                  lineThickness: 2,
                                  dashColor: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: SvgPicture.asset(AppAssets.parcode),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10);
                      },
                      itemCount: 3,
                    ),
                  ),
                ),
                SizedBox(height: 46),
                SizedBox(
                  width: double.infinity,
                  child: CustomeButtonWidget(
                    onPressed: () {},
                    title: "تنزيل التذكرة",
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
