import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/model/event_model.dart';

class MyTicketsScreen extends StatefulWidget {
  const MyTicketsScreen({super.key});

  @override
  _MyTicketsScreenState createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        "تذاكري",
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
                              AppAssets.profileTicket,
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
