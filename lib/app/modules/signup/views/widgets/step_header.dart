import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/font_manger.dart';
import '../../controllers/signup_controller.dart';

class StepHeader extends GetWidget<SignupController> {
  const StepHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * .24,
      decoration: const BoxDecoration(
        gradient: ColorsManger.backgroundGradient,
      ),
      child: SafeArea(
        child: Center(
          child: GetBuilder<SignupController>(
            builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StepIndicator(
                  step: 1,
                  title: 'Complete Profile',
                  isActive: controller.currentPage == 1,
                  isCompleted: controller.currentPage < 1,
                ),
                StepIndicator(
                  step: 2,
                  title: 'Mobile Number',
                  isActive: controller.currentPage == 2,
                  isCompleted: controller.currentPage < 2,
                ),
                StepIndicator(
                  step: 3,
                  title: 'OTP Verification',
                  isActive: controller.currentPage == 3,
                  isCompleted: controller.currentPage < 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    Key? key,
    required this.step,
    required this.title,
    required this.isActive,
    required this.isCompleted,
  }) : super(key: key);
  final int step;
  final String title;
  final bool isActive;
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<SignupController>().pageController.jumpToPage(step - 1);
      },
      child: Column(
        children: [
          Container(
            height: context.height * .12,
            width: context.width * .12,
            decoration: const BoxDecoration(
                color: ColorsManger.white, shape: BoxShape.circle),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: ColorsManger.primary, width: isActive ? 3 : 0)),
              child: Center(
                child: isCompleted
                    ? Text(
                        step.toString(),
                        style: const TextStyle(
                            color: ColorsManger.primary,
                            fontSize: FontSize.xlarge,
                            fontWeight: FontWeight.bold),
                      )
                    : const Icon(
                        Icons.check,
                        size: 30,
                        color: ColorsManger.primary,
                      ),
              ),
            ).paddingAll(2),
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: FontSize.small,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
