import 'package:flutter/material.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/view/widget/custom_navbar.dart';
import 'package:tickets_demo/view/widget/incomming_event_widget.dart';
import 'package:tickets_demo/view/widget/nearest_events_widget.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key, required this.searchController}) : super(key: key);

  final TextEditingController searchController;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                margin: EdgeInsets.only(left: 22, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(AppAssets.userImage),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "اهلا بعودتك",
                      style: TextStyle(
                        color: ThemeColors.thirdColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "عثمان الطائي",
                      style: TextStyle(
                        color: ThemeColors.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            width: 345,
            height: 54,
            child: TextField(
              controller: widget.searchController,
              textDirection: TextDirection.rtl,
              style: TextStyle(color: ThemeColors.thirdColor),
              decoration: InputDecoration(
                hintText: "البحث عن حدث",
                hintTextDirection: TextDirection.rtl,
                labelStyle: TextStyle(color: ThemeColors.secondaryColor),
                suffixIcon: Icon(Icons.search),
                suffixStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ThemeColors.secondaryColor),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColors.thirdColor,
                    width: .5,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          IncommingEventWidget(),
          SizedBox(height: 19),
          NearestEventsWidget(),
        ],
      ),
    );
  }
}
