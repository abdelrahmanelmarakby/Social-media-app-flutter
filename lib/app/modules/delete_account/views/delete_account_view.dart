import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/font_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../controllers/delete_account_controller.dart';

class DeleteAccountView extends GetView<DeleteAccountController> {
  const DeleteAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isButtonActive = true;
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          child: AppBar(
            leading: const Icon(
              Iconsax.arrow_left,
              color: ColorsManger.black,
            ),
            title: Text(
              'Delete My Account',
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
          flex: 1,
          child: SizedBox(
              width: 280,
              child: Text(
                'to delete your account, write the following sentence and enter your phone number',
                style: getRegularTextStyle(
                    fontSize: 16, color: ColorsManger.black),
              )).paddingOnly(left: 60, right: 60, top: 50),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'I confirm to delete my account',
                  style: getRegularTextStyle(
                      fontSize: 12, color: ColorsManger.black),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 1,
                    controller: controller.deleteController,
                    decoration: InputDecoration(
                      counterStyle: getLightTextStyle(),
                      filled: true,
                      fillColor: ColorsManger.light,
                      hintText: 'Re-write ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: ColorsManger.light)),
                    ),
                    onChanged: (value) {
                      if (value.toLowerCase() ==
                          "I confirm to delete my account".toLowerCase()) {
                        controller.isButtonActive.value = true;
                      } else {
                        controller.isButtonActive.value = false;
                      }
                    },
                    onTap: () {},
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Text
                //   'Enter your phone number',
                //   style: getRegularTextStyle(
                //       fontSize: 12, color: ColorsManger.black),
                // ),
                // const SizedBox(height: 10),
                // Container(
                //   height: 50,
                //   decoration:
                //       BoxDecoration(borderRadius: BorderRadius.circular(50)),
                //   child: TextFormField(
                //     minLines: 1,
                //     maxLines: 1,
                //     keyboardType: TextInputType.phone,
                //     decoration: InputDecoration(
                //       suffixIcon: const Icon(Iconsax.call),
                //       counterStyle: getLightTextStyle(),
                //       filled: true,
                //       fillColor: ColorsManger.light,
                //       hintText: '+20 ',
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide:
                //               const BorderSide(color: ColorsManger.light)),
                //     ),
                //     onTap: () {},
                //   ),
                // ),
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Obx(
                    () => Container(
                      height: 56,
                      width: 342,
                      decoration: BoxDecoration(
                          color: controller.isButtonActive.value
                              ? ColorsManger.error
                              : ColorsManger.grey,
                          borderRadius: BorderRadius.circular(50)),
                      child: TextButton(
                        onPressed: () {
                          if (controller.isButtonActive.value) {
                            Get.defaultDialog(
                                title: 'Delete Account',
                                middleText:
                                    'Are you sure you want to delete your account?',
                                textConfirm: 'Yes',
                                textCancel: 'No',
                                confirmTextColor: ColorsManger.white,
                                cancelTextColor: ColorsManger.grey,
                                buttonColor: ColorsManger.error,
                                onConfirm: () {
                                  controller.deleteAccount();
                                },
                                onCancel: () {
                                  Get.back();
                                });
                          }
                        },
                        child: Text("Delete My Account",
                            style: getBoldTextStyle(
                                fontSize: FontSize.medium,
                                color: ColorsManger.white)),
                      ),
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
