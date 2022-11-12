import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/signup_controller.dart';
import 'widgets/complete_profile.dart';
import 'widgets/otp_validation.dart';
import 'widgets/phone_number_form.dart';
import 'widgets/step_header.dart';
import 'package:future_chat/app/modules/share_bottom_sheet/views/share_bottom_sheet_view.dart';


class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          OutlinedButton(
            onPressed:()=> Get.to(()=>const ShareBottomSheetView()),
            child: const Text('Open'),
          ),
          const StepHeader(),
          Expanded(
              child: PageView(
              onPageChanged: (value) {
              controller.currentPage = value + 1;
              controller.update();
            },
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              children: const [
              CompleteProfileForm(),
              MobileNumberForm(),
              OtpVerificationForm(),
            ],
          ))
        ],
      ),
    );
  }
}
