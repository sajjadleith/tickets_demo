import 'package:flutter/material.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/view/widget/all_party_widget.dart';
import 'package:tickets_demo/view/widget/parties_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int currentIndex = 0;
  List<Widget> items = [AllPartyWidget(), PartiesWidget()];

  onChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(""),
                  Text(
                    "استكشف الاحداث",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                  Icon(Icons.search, color: ThemeColors.secondaryColor),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: Container(
                  width: 315,
                  height: 70,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: ThemeColors.fourthColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                          child: InkWell(
                            onTap: () => onChange(1),
                            borderRadius: BorderRadius.circular(6),
                            // ignore: deprecated_member_use
                            splashColor: ThemeColors.secondaryColor.withOpacity(
                              0.3,
                            ),
                            highlightColor: Colors.transparent,
                            child: Ink(
                              width: width,
                              height: 44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: currentIndex == 1
                                    ? ThemeColors.secondaryColor
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  "حفلات",
                                  style: TextStyle(
                                    color: currentIndex == 1
                                        ? ThemeColors.primaryColor
                                        : ThemeColors.secondaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(6),
                            splashColor: ThemeColors.secondaryColor.withOpacity(
                              0.3,
                            ),
                            highlightColor: Colors.transparent,
                            onTap: () => onChange(0),
                            child: Container(
                              width: width,
                              height: 44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),

                                color: currentIndex == 0
                                    ? ThemeColors.secondaryColor
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  "الكل",
                                  style: TextStyle(
                                    color: currentIndex == 0
                                        ? ThemeColors.primaryColor
                                        : ThemeColors.secondaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: items[currentIndex]),
          ],
        ),
      ),
    );
  }
}
