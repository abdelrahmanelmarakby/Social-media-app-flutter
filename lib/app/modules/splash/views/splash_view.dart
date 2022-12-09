import 'package:flutter/material.dart';
import 'package:future_chat/core/resourses/color_manger.dart';

import 'package:get/get.dart';

import '../../../../core/others/intial_widget.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(const CheckSigningIn());
    });
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorsManger.primary,
                ColorsManger.primary.withOpacity(.7),
              ],
            ),
          ),
          height: context.height,
          width: context.width,
          child: Center(
            child: Image.asset(
              "assets/images/animated_logo.gif",
            ),
          )),
    );
  }
}
