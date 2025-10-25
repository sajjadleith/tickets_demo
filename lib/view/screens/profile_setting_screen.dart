import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickets_demo/core/app_assets.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/core/utility/validator.dart';
import 'package:tickets_demo/view/widget/custome_button_widget.dart';
import 'package:tickets_demo/view/widget/phone_widget.dart';
import 'package:tickets_demo/view/widget/testformfield_custom_widget.dart';

class ProfileSettingScreen extends StatefulWidget {
  ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  _ProfileSettingScreenState createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 22, right: 22),
            child: Form(
              key: _formKey,
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
                        "بيانات المستخدم",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: ThemeColors.secondaryColor,
                        ),
                      ),
                      Text(""),
                    ],
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
                  SizedBox(height: 25),
                  Text(
                    "اسم المستخدم",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  TestformfieldCustomWidget(
                    controller: _nameController,
                    validator: Validator.validateName,
                    title: "عثمان الطائي",
                  ),
                  SizedBox(height: 10),
                  Text(
                    "رقم الهاتف",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  TestformfieldCustomWidget(
                    controller: _phoneController,
                    validator: Validator.phoneValidation,
                    title: "اكتب رقم الهاتف",
                  ),
                  SizedBox(height: 10),
                  Text(
                    "البريد الالكتروني",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  TestformfieldCustomWidget(
                    controller: _emailController,
                    validator: Validator.validateEmail,
                    title: "اكتب البريد الالكتروني",
                  ),
                  SizedBox(height: 256),
                  SizedBox(
                    width: double.infinity,
                    child: CustomeButtonWidget(
                      onPressed: () {},
                      title: "حفظ البيانات",
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
