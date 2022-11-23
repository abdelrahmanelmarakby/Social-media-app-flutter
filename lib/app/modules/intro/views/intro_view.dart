import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:future_chat/core/language/local_keys.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:future_chat/core/resourses/values_manger.dart';

import 'package:get/get.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../routes/app_pages.dart';
import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: context.height,
      width: context.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        ColorsManger.primary,
        ColorsManger.primary.withOpacity(0.5)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    LocalKeys.appName.tr,
                    style: getBoldTextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Connect",
                  style: getRegularTextStyle(color: Colors.white, fontSize: 48),
                ),
                const SizedBox(height: AppSize.size12),
                Text(
                  "friends",
                  style: getRegularTextStyle(color: Colors.white, fontSize: 48),
                ),
                const SizedBox(height: AppSize.size12),
                FadeInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: Text(
                    "Easily,",
                    style: getBoldTextStyle(color: Colors.white, fontSize: 48),
                  ),
                ),
                const SizedBox(height: AppSize.size12),
                FadeInLeft(
                  duration: const Duration(milliseconds: 2000),
                  child: Text(
                    "Quickly &",
                    style: getBoldTextStyle(color: Colors.white, fontSize: 48),
                  ),
                ),
                FadeInLeft(
                  duration: const Duration(milliseconds: 3000),
                  child: Text(
                    "Securely",
                    style: getBoldTextStyle(color: Colors.white, fontSize: 48),
                  ),
                ),
                const SizedBox(height: AppSize.size12),
                Text(
                  "Our chat app is the perfect way to stay connected with friends and family.",
                  style: getRegularTextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ).paddingSymmetric(horizontal: 20),
            const Spacer(
              flex: 2,
            ),
            FutureBuilder(
              future: controller.position,
              builder: (context, snapshot) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: context.width,
                        height: 48,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.SIGNUP, arguments: {
                              "position": snapshot.data,
                            });
                          },
                          child: Text(
                            "Get Started ",
                            style: getBoldTextStyle(color: Colors.black),
                          ),
                        ).paddingSymmetric(horizontal: 20),
                      ),
                      const SizedBox(height: AppSize.size4),
                      SizedBox(
                        width: context.width,
                        height: 48,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            // backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.LOGIN, arguments: {
                              "position": snapshot.data,
                            });
                          },
                          child: Text(
                            "Existing account ? Login",
                            style: getRegularTextStyle(color: Colors.white),
                          ),
                        ).paddingSymmetric(horizontal: 20),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    ));
  }
}
