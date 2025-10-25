import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/theme_colors.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    required this.iconSvg,
    required this.color,
    required this.cardTitle,
    required this.onTap,
  });
  final String iconSvg;
  final Color color;
  final String cardTitle;
  final VoidCallback onTap;

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.arrowBack),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.cardTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: widget.color,
                    ),
                    child: SvgPicture.asset(
                      widget.iconSvg,
                      width: 24,
                      height: 24,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
