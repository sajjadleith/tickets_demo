import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/view/widget/navbar_icons_widget.dart';

class CustomNavbar extends StatefulWidget {
  CustomNavbar({Key? key, required this.currentIndex, required this.onChange})
    : super(key: key);
  final int currentIndex;
  final Function(int) onChange;

  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 91,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavbarIconsWidget(
            icon: AppAssets.home,
            onTap: () => widget.onChange(0),
            color: widget.currentIndex == 0 ? ThemeColors.secondaryColor : null,
          ),
          NavbarIconsWidget(
            icon: AppAssets.discovery,
            onTap: () => widget.onChange(1),
            color: widget.currentIndex == 1 ? ThemeColors.secondaryColor : null,
          ),
          NavbarIconsWidget(
            icon: AppAssets.bookmark,
            onTap: () => widget.onChange(2),
            color: widget.currentIndex == 2 ? ThemeColors.secondaryColor : null,
          ),
          NavbarIconsWidget(
            icon: AppAssets.profile,
            onTap: () => widget.onChange(3),
            color: widget.currentIndex == 3 ? ThemeColors.secondaryColor : null,
          ),
        ],
      ),
    );
  }
}
