import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/model/event_model.dart';
import 'package:tickets_demo/view/widget/custome_button_widget.dart';
import 'package:tickets_demo/view/widget/date_picker_widget.dart';
import 'package:tickets_demo/view/widget/show_bottom_sheet_widget.dart';
import 'package:tickets_demo/view/widget/testformfield_custom_widget.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final Map? info;
  const PaymentSuccessScreen({super.key, this.info});

  @override
  _PaymentSuccessScreenState createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final args = widget.info ?? {};
    final selectedSeats = args["selectedCount"];
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController carNumberController = TextEditingController();
    final TextEditingController cvvController = TextEditingController();

    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 22, right: 22),
            child: Form(
              key: formKey,
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
                  Text(
                    "تفاصيل الدفع",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "البريد الالكتروني",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  TestformfieldCustomWidget(
                    controller: emailController,
                    validator: null,
                    title: "testforpay@gmail.com",
                  ),
                  SizedBox(height: 16),
                  Text(
                    "اسم حامل البطاقة",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  TestformfieldCustomWidget(
                    controller: nameController,
                    validator: null,
                    title: "Othman Luqman",
                  ),
                  SizedBox(height: 16),
                  Text(
                    "رقم البطاقة",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  TestformfieldCustomWidget(
                    controller: carNumberController,
                    validator: null,
                    title: "1234 5678 9101 13131",
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "تاريخ الانتهاء",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: ThemeColors.secondaryColor,
                            ),
                          ),
                          SizedBox(height: 10),
                          ExpiryDatePicker(),
                        ],
                      ),
                      SizedBox(width: 50),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "CVV",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: ThemeColors.secondaryColor,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 141,
                              height: 48,
                              child: TestformfieldCustomWidget(
                                controller: cvvController,
                                validator: null,
                                title: "123",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 90),
                  SizedBox(
                    width: double.infinity,
                    child: CustomeButtonWidget(
                      onPressed: () =>
                          ShowBottomSheetWidget.showBottomSheet(context),
                      title: "شراء الان",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
