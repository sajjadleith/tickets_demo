import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/view/widget/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 22, right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Text(
                    "الاعدادات",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "عثمان الطائي",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.secondaryColor,
                          ),
                        ),
                        Text(
                          "مستخدم",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.thirdColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(AppAssets.personImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 36),
                Divider(thickness: 2, color: ThemeColors.fourthColor),
                SizedBox(height: 16),
                Text(
                  "المستخدم",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ThemeColors.secondaryColor,
                  ),
                ),
                SizedBox(height: 16),
                ProfileWidget(
                  cardTitle: "بيانات المستخدم",
                  color: ThemeColors.profileColor1,
                  iconSvg: AppAssets.message,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.profilePage);
                  },
                ),
                SizedBox(height: 16),
                ProfileWidget(
                  cardTitle: "المحفظة",
                  color: ThemeColors.profileColor2,
                  iconSvg: AppAssets.wallet,
                  onTap: () {},
                ),
                SizedBox(height: 16),
                ProfileWidget(
                  cardTitle: "الغاء تفعيل الحساب",
                  color: ThemeColors.redColor,
                  iconSvg: AppAssets.trash,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.cancelPage);
                  },
                ),
                Divider(thickness: 2, color: ThemeColors.fourthColor),
                SizedBox(height: 16),
                Text(
                  "اعدادات اضافية",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ThemeColors.secondaryColor,
                  ),
                ),
                SizedBox(height: 16),
                ProfileWidget(
                  cardTitle: "الاشعارات",
                  color: ThemeColors.profileColor3,
                  iconSvg: AppAssets.ring,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.notificationPage);
                  },
                ),
                SizedBox(height: 16),
                ProfileWidget(
                  cardTitle: "تذاكري",
                  color: ThemeColors.profileColor2,
                  iconSvg: AppAssets.profileTicket,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.myTicketsPage);
                  },
                ),
                SizedBox(height: 16),
                ProfileWidget(
                  cardTitle: "تسجيل الخروج",
                  color: ThemeColors.redColor,
                  iconSvg: AppAssets.logout,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.loginPage);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
