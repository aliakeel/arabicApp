import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/auth/controller.dart';
import 'package:kaleela/views/auth/widgets/auth_textField.dart';
import 'package:kaleela/widgets/buttons/custom_button.dart';

class AuthWidget extends StatelessWidget {
  final bool isLoging;
  const AuthWidget({super.key, required this.isLoging});

  @override
  Widget build(BuildContext context) {
    return isLoging
        ? GetBuilder<AuthController>(builder: (_) {
            return Container(
              width: Get.width * 0.85,
              decoration: BoxDecoration(
                color: offwhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  15.r.verticalSpace,
                  Text(
                    'Login',
                    style: tajawal_samll_black,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(hint: 'Email'),
                  15.r.verticalSpace,
                  AuthTextfield(hint: 'Password'),
                  15.r.verticalSpace,
                  CustomButton(
                    height: 45,
                    text: 'Login',
                    color: light_purple,
                    width: Get.width * 0.6,
                    ontap: (){
                      Get.offAllNamed('/chooseLanguage');
                    },
                    textStyle: tajawal_xSamll_white_bold,
                  ),
                  15.r.verticalSpace,
                  SizedBox(
                    width: Get.width * 0.6,
                    child: Divider(
                      thickness: 2,
                      color: black,
                    ),
                  ),
                  15.r.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account ?',
                        style: tajawal_xSamll_black,
                      ),
                      GestureDetector(
                        onTap: () {
                          _.loginToggle();
                        },
                        child: Text(
                          ' Sign up',
                          style: tajawal_xSamll_black_bold_underlined,
                        ),
                      ),
                    ],
                  ),
                  15.r.verticalSpace,
                ],
              ),
            );
          })
        : GetBuilder<AuthController>(builder: (_) {
            return Container(
              width: Get.width * 0.85,
              decoration: BoxDecoration(
                color: offwhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  15.r.verticalSpace,
                  Text(
                    'Sign up',
                    style: tajawal_samll_black,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(hint: 'Username'),
                  15.r.verticalSpace,
                  AuthTextfield(hint: 'Email'),
                  15.r.verticalSpace,
                  AuthTextfield(hint: 'Password'),
                  15.r.verticalSpace,
                  AuthTextfield(hint: 'Confirm Password'),
                  15.r.verticalSpace,
                  CustomButton(
                    color: light_purple,
                    height: 45,
                    text: 'Sign up',
                    width: Get.width * 0.6,
                    textStyle: tajawal_xSamll_white_bold,
                  ),
                  15.r.verticalSpace,
                  SizedBox(
                    width: Get.width * 0.6,
                    child: Divider(
                      thickness: 2,
                      color: black,
                    ),
                  ),
                  15.r.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ?',
                        style: tajawal_xSamll_black,
                      ),
                      GestureDetector(
                        onTap: () {
                          _.loginToggle();
                        },
                        child: Text(
                          ' Login',
                          style: tajawal_xSamll_black_bold_underlined,
                        ),
                      ),
                    ],
                  ),
                  15.r.verticalSpace,
                ],
              ),
            );
          });
  }
}
