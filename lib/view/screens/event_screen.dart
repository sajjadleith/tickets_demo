import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/model/event_model.dart';
import 'package:tickets_demo/view/widget/custome_button_widget.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
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
                      "تفاصيل الحدث",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.secondaryColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        alignment: Alignment.center,
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SvgPicture.asset(
                          AppAssets.save,
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
                  ],
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 450,
                  child: CachedNetworkImage(
                    imageUrl: eventList[0].eventImg,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    placeholder: (context, url) {
                      return Skeletonizer(
                        enabled: true,
                        enableSwitchAnimation: true,
                        child: Container(
                          width: 312,
                          height: 370,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) => Skeletonizer(
                      enabled: false,
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Text(
                    eventList[0].name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 5.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          eventList[0].seats.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: ThemeColors.thirdColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        SvgPicture.asset(AppAssets.seat, width: 20, height: 20),
                        SizedBox(width: 10),
                        Text(
                          "|",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: ThemeColors.thirdColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      eventList[0].date,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: ThemeColors.thirdColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff252932),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          eventList[0].seats.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ThemeColors.thirdColor,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff252932),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "بغداد - المنصور - مول المنصور",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ThemeColors.thirdColor,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff252932),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "08:00 مساءاً",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ThemeColors.thirdColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Text(
                    "معلومات عن الحدث",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text.rich(
                  textAlign: TextAlign.end,
                  TextSpan(
                    text:
                        "يتميز الحدث بحضور المطربين والمشهورين العرب لحضور هذا الحدث عليك شراء تذكرة وتحديد المقعد الخاص بك ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ThemeColors.thirdColor,
                    ),
                    children: [
                      TextSpan(
                        text: "قراءة المزيد",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: CustomeButtonWidget(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.seatSelectionPage,
                        arguments: null,
                      );
                    },
                    title: 'حجز مقعد',
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
