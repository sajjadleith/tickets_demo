import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavbarIconsWidget extends StatefulWidget {
  NavbarIconsWidget({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  final String icon;
  final Function onTap;
  final Color? color;
  @override
  _NavbarIconsWidgetState createState() => _NavbarIconsWidgetState();
}

class _NavbarIconsWidgetState extends State<NavbarIconsWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => widget.onTap(),
        child: SvgPicture.asset(
          widget.icon,
          width: 19,
          height: 20,
          color: widget.color,
        ),
      ),
    );
  }
}
