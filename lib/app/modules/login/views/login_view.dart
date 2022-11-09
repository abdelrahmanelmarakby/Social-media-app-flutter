import 'package:flutter/material.dart';
import 'package:future_chat/app/modules/login/views/login_otp_validation.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'login_phone_number_form.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: context.height * .25,
            color: ColorsManger.primary,
            child: SafeArea(
              child: Center(
                child: Text(
                  "Login",
                  style: getBoldTextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
              child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              MobileNumberLoginForm(),
              OtpVerificationLoginForm()
            ],
          ))
        ],
      ),
    );
  }
}
