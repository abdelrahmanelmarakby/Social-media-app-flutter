import 'package:flutter/material.dart';

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
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          child: ListTile(
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
          ),
          onTap: () {
                Get.back();
              },
        ),
        const SizedBox(
          height: 40,
        ),
        Expanded(
            child: ListTile(
          leading: CircleAvatar(
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
            style: getMediumTextStyle(color: ColorsManger.black, fontSize: 16),
          ),
          onTap: () {},
        )),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListTile(
          leading: CircleAvatar(
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
            style: getMediumTextStyle(color: ColorsManger.black, fontSize: 16),
          ),
          onTap: () {
            Get.to(() => const TermsAndPolicy());
          },
        )),
        const SizedBox(height:550,),
      ],
    ));
  }
}
