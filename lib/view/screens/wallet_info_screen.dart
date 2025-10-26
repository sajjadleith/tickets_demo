import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/core/utility/validator.dart';
import 'package:tickets_demo/view/widget/balance_card_widget.dart';
import 'package:tickets_demo/view/widget/custome_button_widget.dart';
import 'package:tickets_demo/view/widget/date_picker_widget.dart';
import 'package:tickets_demo/view/widget/show_bottom_sheet_widget.dart';
import 'package:tickets_demo/view/widget/testformfield_custom_widget.dart';

class WalletInfoScreen extends StatefulWidget {
  WalletInfoScreen({Key? key}) : super(key: key);

  @override
  _WalletInfoScreenState createState() => _WalletInfoScreenState();
}

class _WalletInfoScreenState extends State<WalletInfoScreen> {
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _cVVController = TextEditingController();
  void _submit() {
    if (_keyForm.currentState!.validate()) {
      ShowBottomSheetWidget.showBottomSheet2(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 22, right: 22),
            child: Form(
              key: _keyForm,
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
                  BalanceCard(),
                  SizedBox(height: 16),
                  Text(
                    "تعبئة المحفظة",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "المبلغ",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  TestformfieldCustomWidget(
                    controller: _amountController,
                    validator: null,
                    title: "اكتب المبلغ",
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
                    controller: _nameController,
                    validator: Validator.validateName,
                    title: "اكتب اسم حامل البطاقة",
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
                    controller: _numberController,
                    validator: Validator.validateCard,
                    title: "اكتب رقم البطاقة",
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
                          ExpiryDatePicker(
                            validator: (value) =>
                                Validator.validateExpiryDate(value),
                          ),
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
                              // width: 141,
                              // height: 48,
                              child: TestformfieldCustomWidget(
                                controller: _cVVController,
                                validator: Validator.validateCVV,
                                title: "123",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  SizedBox(
                    width: double.infinity,
                    child: CustomeButtonWidget(
                      onPressed: () {
                        _submit();
                      },
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
