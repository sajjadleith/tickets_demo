import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/model/event_model.dart';

class PartiesWidget extends StatefulWidget {
  PartiesWidget({Key? key}) : super(key: key);

  @override
  _PartiesWidgetState createState() => _PartiesWidgetState();
}

class _PartiesWidgetState extends State<PartiesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(eventList.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.eventPage);
          },
          child: SizedBox(
            height: 90,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SvgPicture.asset(
                        AppAssets.seat,
                        width: 12,
                        height: 20,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      eventList[index].seats.toString(),
                      style: TextStyle(
                        fontSize: 24,
                        color: ThemeColors.thirdColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            eventList[index].location,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: ThemeColors.secondaryColor,
                            ),
                          ),
                          SizedBox(width: 5),
                          SvgPicture.asset(AppAssets.location),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        eventList[index].name.toString(),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: ThemeColors.secondaryColor,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        eventList[index].date,
                        style: TextStyle(
                          color: ThemeColors.thirdColor,
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 76,
                  height: 76,
                  margin: EdgeInsets.only(left: 30),
                  child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    imageUrl: eventList[index].eventImg,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return Skeletonizer(
                        enabled: true,
                        enableSwitchAnimation: true,
                        child: Container(
                          width: double.infinity,
                          height: 76,
                          color: Colors.red,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) => Skeletonizer(
                      enabled: false,
                      child: Container(
                        width: double.infinity,
                        height: 76,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
