import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/view/widget/balance_card_widget.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.settingPage);
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        alignment: Alignment.center,
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SvgPicture.asset(
                          AppAssets.arrowBack,
                          colorFilter: ColorFilter.mode(
                            ThemeColors.secondaryColor,
                            BlendMode.srcIn,
                          ),
                          width: 18,
                          height: 18,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Text(
                      "المحفظة",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.secondaryColor,
                      ),
                    ),
                    Text(""),
                  ],
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.walletInfoPage);
                  },
                  child: BalanceCard(),
                ),
                SizedBox(height: 16),
                Text(
                  "العمليات المالية",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ThemeColors.secondaryColor,
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "ايداع مبلغ 50,000 د.ع",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeColors.secondaryColor,
                                ),
                              ),
                              Text(
                                "02/02/2024",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          SvgPicture.asset(AppAssets.wallet),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
