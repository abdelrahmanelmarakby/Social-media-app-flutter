import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/font_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../../../data/remote_firebase_services/user_services.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            child: AppBar(
              leading: const Icon(
                Iconsax.arrow_left,
                color: ColorsManger.black,
              ),
              title: Text(
                'Edit Profile',
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
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: controller.imagePicked.value
                            ? Image.file(
                                controller.image,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                fit: BoxFit.cover,
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                              )
                        //child: Image.network(UserService.myUser?.photoUrl ?? ''),
                        ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 3,
                    child: SizedBox(
                      width: 38,
                      height: 38,
                      child: FloatingActionButton(
                        backgroundColor: ColorsManger.white,
                        onPressed: () {
                          controller.pickImage();
                        },
                        child: const Icon(
                          Iconsax.camera,
                          color: ColorsManger.primary,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 25, right: 25),
                    child: Text(
                      'Name',
                      style: getMediumTextStyle(
                          color: ColorsManger.grey, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 25, right: 25),
                    child: Text(
                      '${UserService.myUser?.firstName} ${UserService.myUser?.lastName}',
                      style: getMediumTextStyle(
                          color: ColorsManger.black, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 25, right: 25),
                    child: Text(
                      'Phone Number',
                      style: getMediumTextStyle(
                          color: ColorsManger.grey, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 25, bottom: 250, right: 25),
                    child: Text(
                      '${UserService.myUser?.phoneNumber}',
                      style: getMediumTextStyle(
                          color: ColorsManger.black, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: Container(
                      height: 56,
                      width: 342,
                      decoration: BoxDecoration(
                          gradient: ColorsManger.buttonGradient,
                          borderRadius: BorderRadius.circular(50)),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          //controller.updateProfile();
                        },
                        child: Text("Save Changes",
                            style: getBoldTextStyle(
                              fontSize: 18,
                              color: ColorsManger.white,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
