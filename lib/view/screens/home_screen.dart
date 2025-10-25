import 'package:flutter/material.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/view/screens/bookmark_screen.dart';
import 'package:tickets_demo/view/screens/explore_screen.dart';
import 'package:tickets_demo/view/screens/profile_screen.dart';
import 'package:tickets_demo/view/widget/custom_navbar.dart';
import 'package:tickets_demo/view/widget/home_widget.dart';
import 'package:tickets_demo/view/widget/incomming_event_widget.dart';
import 'package:tickets_demo/view/widget/nearest_events_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();

  late List<Widget> screens = [
    HomeWidget(searchController: _searchController),
    ExploreScreen(),
    BookmarkScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;
  void onChange(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: CustomNavbar(
        onChange: onChange,
        currentIndex: currentIndex,
      ),
    );
  }
}
