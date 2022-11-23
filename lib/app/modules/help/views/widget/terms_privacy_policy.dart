import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';

class TermsAndPolicy extends StatelessWidget {
  const TermsAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              child: ListTile(
                leading: const Icon(
                  Iconsax.arrow_left,
                  color: ColorsManger.black,
                ),
                title: Text(
                  'Terms and Privacy Policy',
                  style: getBoldTextStyle(
                    color: ColorsManger.black,
                  ),
                ),
              ),
              onTap: () {
                navigator!.pop();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Terms',
                style:
                    getMediumTextStyle(color: ColorsManger.black, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'We’re constantly developing new technologies and features to improve our services. For example, we use artificial intelligence and machine learning to provide you with simultaneous translations, and to better detect and block spam and malware. As part of this continual improvement, we sometimes add or remove ',
                style:
                    getMediumTextStyle(color: ColorsManger.black, fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Privacy Policy',
                style:
                    getMediumTextStyle(color: ColorsManger.black, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                'We’re constantly developing new technologies and features to improve our services. For example, we use artificial intelligence and machine learning to provide you with simultaneous translations, and to better detect and block spam and malware. As part of this continual improvement, we sometimes add or remove features and functionalities, increase or decrease limits to our servicess',
                style:
                    getMediumTextStyle(color: ColorsManger.black, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
