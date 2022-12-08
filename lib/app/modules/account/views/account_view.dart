import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/font_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../../delete_account/views/delete_account_view.dart';
import '../../edit_profile/views/edit_profile_view.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({Key? key}) : super(key: key);
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
              'Account',
              style: getBoldTextStyle(
                fontSize: FontSize.xlarge,
                color: ColorsManger.black,
                fontWeight: FontWeight.bold,
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
                      Iconsax.edit,
                      color: ColorsManger.primary,
                    ),
                  ),
                ),
                title: GestureDetector(
                  child: Text(
                    'Edit Profile',
                    style: getMediumTextStyle(
                        color: ColorsManger.black, fontSize: 16),
                  ),
                  onTap: () {
                    Get.to(() => const EditProfileView());
                  },
                ),
              )),
              Expanded(
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
                      Iconsax.trash,
                      color: ColorsManger.primary,
                    ),
                  ),
                ),
                title: GestureDetector(
                  child: Text(
                    'Delete my account',
                    style: getMediumTextStyle(
                        color: ColorsManger.black, fontSize: 16),
                  ),
                  onTap: () {
                    Get.to(() => const DeleteAccountView());
                  },
                ),
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
