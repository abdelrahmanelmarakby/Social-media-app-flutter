import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../../delete_account/views/delete_account_view.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
              'Account',
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
          height: 50,
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
                Iconsax.lock,
                color: ColorsManger.primary,
              ),
            ),
          ),
          title: GestureDetector(
            child: Text(
              'Privacy',
              style:
                  getMediumTextStyle(color: ColorsManger.black, fontSize: 16),
            ),
            onTap: () {
              Get.bottomSheet(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text('Privacy',
                                style: getMediumTextStyle(
                                  fontSize: 18,
                                  color: ColorsManger.black,
                                )).paddingOnly(left: 130),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              ' Profile photo',
                              style: getRegularTextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Story',
                              style: getRegularTextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Read recepits',
                              style: getRegularTextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Online statue',
                              style: getRegularTextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ]),
                    ),
                  ));
            },
          ),
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
                Iconsax.trash,
                color: ColorsManger.primary,
              ),
            ),
          ),
          title: GestureDetector(
            child: Text(
              'Delete my account',
              style:
                  getMediumTextStyle(color: ColorsManger.black, fontSize: 16),
            ),
            onTap: () {
              Get.to(() => const DeleteAccountView());
            },
          ),
        )),
        const SizedBox(
          height: 550,
        ),
      ],
    ));
  }
}
