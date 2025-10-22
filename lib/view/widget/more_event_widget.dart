import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/model/event_model.dart';

class MoreEventWidget extends StatefulWidget {
  const MoreEventWidget({super.key});

  @override
  _MoreEventWidgetState createState() => _MoreEventWidgetState();
}

class _MoreEventWidgetState extends State<MoreEventWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 30, end: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "مشاهدة الجميع",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.thirdColor,
                ),
              ),
              Text(
                "احداث متنوعة",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.69,
            enableInfiniteScroll: false,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 3),
            height: 470,
            padEnds: false,
          ),
          items: eventList.map((event) {
            return Builder(
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 230,
                      height: 300,
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
                      padding: const EdgeInsetsDirectional.only(
                        end: 22,
                        start: 22,
                      ),
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
