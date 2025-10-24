import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/model/event_model.dart';
import 'package:tickets_demo/view/widget/custom_button_price_widget.dart';
import 'package:tickets_demo/view/widget/price_widget.dart';

class CheckoutScreen extends StatefulWidget {
  final Map? info;
  const CheckoutScreen({super.key, this.info});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final args = widget.info ?? {};
    int selectedSeats = args["selectedCount"] ?? 0;
    int subTotal = selectedSeats * eventList[0].price!;
    Map discount = {"GFJDKVJN": 50};
    double discountPercent = discount.values.first.toDouble(); // 50
    double discountAmount =
        subTotal * (discountPercent / 100); // تحسب مبلغ الخصم
    double total = subTotal - discountAmount; // السعر بعد الخصم

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
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
                      "اختيار المقاعد",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.secondaryColor,
                      ),
                    ),
                    Text(""),
                  ],
                ),
                SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 56,
                          height: 18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: ThemeColors.fourthColor,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            "حفلات",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: ThemeColors.secondaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          eventList[0].name,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.secondaryColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text.rich(
                            TextSpan(
                              text: "عدد التذاكر المختارة : ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: ThemeColors.thirdColor,
                              ),
                              children: [
                                TextSpan(
                                  text: selectedSeats.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: ThemeColors.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 76,
                      height: 76,
                      child: CachedNetworkImage(
                        imageUrl: eventList[0].eventImg,
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
                        placeholder: (context, url) {
                          return Skeletonizer(
                            enabled: true,
                            enableSwitchAnimation: true,
                            child: Container(
                              width: double.infinity,
                              height: 76,
                              decoration: BoxDecoration(
                                color: ThemeColors.thirdColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                        errorWidget: (context, url, error) => Skeletonizer(
                          enabled: false,
                          child: Container(
                            width: double.infinity,
                            height: 76,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ThemeColors.fourthColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        color: ThemeColors.secondaryColor,
                        borderRadius: BorderRadius.circular(6),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(6),
                          child: SizedBox(
                            width: 150,
                            height: 44,
                            child: Center(
                              child: Text(
                                "GFJDKVJN",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "كود خصم",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ThemeColors.thirdColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 186,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ThemeColors.fourthColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          end: 10,
                          top: 5,
                        ),
                        child: Text(
                          "معلومات الدفع",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.secondaryColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        child: Divider(
                          color: ThemeColors.thirdColor,
                          thickness: 1,
                          height: 20,
                        ),
                      ),
                      PriceWidget(
                        price: eventList[0].price!,
                        title: "سعر التذكرة",
                      ),
                      PriceWidget(
                        price: selectedSeats,
                        title: "عدد التذاكر المختارة",
                      ),
                      PriceWidget(
                        price: discountPercent.toInt(),
                        title: "تطبيق كود الخصم",
                      ),
                      PriceWidget(
                        price: subTotal,
                        title: "السعر الكلي للتذاكر",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 265),
                CustomButtonPriceWidget(
                  total: total.toInt(),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.paymentPage,
                      arguments: {"selectedCount": selectedSeats},
                    );
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
