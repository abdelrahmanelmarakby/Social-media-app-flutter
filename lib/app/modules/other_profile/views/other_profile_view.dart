import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/user_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/app/modules/chat/views/chat_screen.dart';
import 'package:future_chat/core/services/encryption_service.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../controllers/other_profile_controller.dart';

class OtherProfileView extends GetView<OtherProfileController> {
  const OtherProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SocialMediaUser?>(
          future: UserService().getProfile(controller.userId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              SocialMediaUser user = snapshot.data!;
              return Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Iconsax.arrow_left,
                            color: ColorsManger.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        user.photoUrl ?? "",
                      ),
                    ),
                  ),
                  Text(
                    " ${user.firstName ?? ""} ${user.lastName ?? ""}",
                    style: getMediumTextStyle(
                        color: ColorsManger.black, fontSize: 20),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 50, top: 10),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          height: 46,
                          width: 46,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ColorsManger.light,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Iconsax.message,
                                color: ColorsManger.primary,
                              ),
                              onPressed: () {
                                Get.to(
                                  () => ChatScreen(
                                    hisId: user.phoneNumber?.replaceAll(
                                            RegExp("[^a-zA-Z0-9 ]"), "") ??
                                        "",
                                    hisImage: user.photoUrl ?? "",
                                    hisName:
                                        "${user.firstName ?? ""} ${user.lastName ?? ""}",
                                    myId: UserService.myUser?.phoneNumber
                                            ?.replaceAll(
                                                RegExp("[^a-zA-Z0-9 ]"), "") ??
                                        "",
                                    myImage: UserService.myUser?.photoUrl ?? "",
                                    myName:
                                        "${UserService.myUser?.firstName ?? ""} ${UserService.myUser?.lastName ?? ""}",
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          height: 46,
                          width: 46,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ColorsManger.light,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Iconsax.video,
                                color: ColorsManger.primary,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          height: 46,
                          width: 46,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ColorsManger.light,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Iconsax.call,
                                color: ColorsManger.primary,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          height: 46,
                          width: 46,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: ColorsManger.light,
                              ),
                              child: PopupMenuButton(
                                  icon: const Icon(Iconsax.more,
                                      color: ColorsManger.primary),
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<String>>[
                                        PopupMenuItem<String>(
                                            value: '1',
                                            child: const Text('Share'),
                                            onTap: () {}),
                                        PopupMenuItem<String>(
                                            value: '2',
                                            child:
                                                const Text('View in contact'),
                                            onTap: () {}),
                                      ])),
                        ),
                      ],
                    ),
                  )),
                  Container(
                    height: 480,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: ColorsManger.light),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Phone Number',
                          style: getMediumTextStyle(
                              color: ColorsManger.grey, fontSize: 12),
                        ).paddingOnly(left: 24, top: 10),
                        Text(
                          user.phoneNumber ?? "",
                          style: getMediumTextStyle(
                              color: ColorsManger.black, fontSize: 16),
                        ).paddingOnly(left: 27),
                        FutureBuilder(
                          future: controller
                              .getChatImagesUrl(user.phoneNumber ?? ""),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<String> images =
                                  snapshot.data as List<String>;
                              return images.isNotEmpty
                                  ? Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: images.length,
                                          itemBuilder: (context, index) {
                                            return SizedBox(
                                              height: 95,
                                              width: 95,
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5, left: 5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          images[index].decrypt,
                                                          height: 70,
                                                          width: 70,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          }),
                                    )
                                  : const SizedBox(
                                      height: 8,
                                    );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, top: 0, bottom: 100),
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 46,
                                        width: 46,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: ColorsManger.white,
                                          ),
                                          child: const Icon(
                                            Iconsax.volume_slash,
                                            color: ColorsManger.primary,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Mute notification',
                                          style:
                                              getMediumTextStyle(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 46,
                                        width: 46,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: ColorsManger.white,
                                          ),
                                          child: const Icon(
                                            Iconsax.gallery,
                                            color: ColorsManger.primary,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Media visiability',
                                          style:
                                              getMediumTextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 46,
                                        width: 46,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: ColorsManger.white,
                                          ),
                                          child: const Icon(
                                            Iconsax.slash,
                                            color: ColorsManger.primary,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Block',
                                          style:
                                              getMediumTextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
            } else {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
          }),
    );
  }
}
