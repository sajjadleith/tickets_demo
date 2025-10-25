import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/core/utility/validator.dart';
import 'package:tickets_demo/view/widget/custome_button_widget.dart';
import 'package:tickets_demo/view/widget/phone_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppAssets.logo),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.5, left: 15.5),
                    child: PhoneWidget(
                      formKey: _key,
                      phoneController: _phoneController,
                      phoneValidation: Validator.phoneValidation,
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.5, right: 15.5),
                    child: SizedBox(
                      width: double.infinity,
                      height: 57,
                      child: CustomeButtonWidget(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("الرقم صحيح")),
                            );
                            Navigator.pushNamed(context, AppRoutes.otpPage);
                          }
                        },
                        title: "تسجيل الدخول",
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 22.5),
                      child: Text.rich(
                        TextSpan(
                          text: "تسجيل الدخول",
                          style: TextStyle(
                            color: ThemeColors.thirdColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: " كضيف",
                              style: TextStyle(
                                color: ThemeColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
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
