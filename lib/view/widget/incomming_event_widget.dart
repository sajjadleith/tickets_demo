import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/model/event_model.dart';

class IncommingEventWidget extends StatefulWidget {
  const IncommingEventWidget({super.key});

  @override
  State<IncommingEventWidget> createState() => _IncommingFestivalWidgetState();
}

class _IncommingFestivalWidgetState extends State<IncommingEventWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Align(
            alignment: AlignmentGeometry.centerRight,
            child: Text(
              "الاحداث القادمة",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: ThemeColors.secondaryColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            height: 270,
          ),
          items: eventList.map((event) {
            return Builder(
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 345,
                      height: 200,
                      child: CachedNetworkImage(
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
                        imageUrl: event.eventImg,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return Skeletonizer(
                            enabled: true,
                            enableSwitchAnimation: true,
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              color: Colors.red,
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
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: Column(
                          children: [
                            Text(
                              event.name,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: ThemeColors.secondaryColor,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              event.date,
                              style: TextStyle(
                                fontSize: 14,
                                color: ThemeColors.thirdColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
