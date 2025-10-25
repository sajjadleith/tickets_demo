import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/model/event_model.dart';
import 'package:tickets_demo/view/widget/custom_search_widget.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
                Center(
                  child: Text(
                    "الاحداث المحفوظة",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 26),
                CustomSearchWidget(controller: searchController),
                SizedBox(height: 10),
                Column(
                  children: List.generate(eventList.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.eventPage);
                      },
                      child: SizedBox(
                        height: screenHeight * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppAssets.bookmark,
                              colorFilter: ColorFilter.mode(
                                ThemeColors.secondaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.19),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                Flexible(
                                  child: Text(
                                    eventList[index].name.toString(),
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: ThemeColors.secondaryColor,
                                    ),
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
                            SizedBox(width: screenWidth * 0.04),
                            SizedBox(
                              width: screenWidth * 0.2,
                              height: screenHeight * 0.12,
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
                                      height: screenHeight * 0.12,
                                      color: Colors.red,
                                    ),
                                  );
                                },
                                errorWidget: (context, url, error) =>
                                    Skeletonizer(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
