import 'package:flutter/material.dart';
import 'package:future_chat/app/modules/contact_us/views/contact_us_view.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../controllers/help_controller.dart';
import 'widget/terms_privacy_policy.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        GestureDetector(
          child: AppBar(
            leading: const Icon(
              Iconsax.arrow_left,
              color: ColorsManger.black,
            ),
            title: Text(
              'Help Center',
              style: getBoldTextStyle(
                color: ColorsManger.black,
              ),
            ),
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          onTap: () {
            Get.back();
          },
        ),
        Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Expanded(
                  child: GestureDetector(
                child: ListTile(
                  leading: ClipRRect(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorsManger.light,
                      ),
                      child: const Icon(
                        Iconsax.warning_2,
                        color: ColorsManger.primary,
                      ),
                    ),
                  ),
                  title: Text(
                    'Contact Us',
                    style: getMediumTextStyle(
                        color: ColorsManger.black, fontSize: 16),
                  ),
                ),
                onTap: () {
                  Get.to(() => const ContactUsView());
                },
              )),
              Expanded(
                  child: GestureDetector(
                child: ListTile(
                  leading: ClipRRect(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorsManger.light,
                      ),
                      child: const Icon(
                        Iconsax.warning_2,
                        color: ColorsManger.primary,
                      ),
                    ),
                  ),
                  title: Text(
                    'Terms and Privacy Police',
                    style: getMediumTextStyle(
                        color: ColorsManger.black, fontSize: 16),
                  ),
                ),
                onTap: () {
                  Get.to(() => const TermsAndPolicy());
                },
              )),
            ],
          ),
        ),
        const Spacer(
          flex: 3,
        )
      ],
    ));
  }
}
