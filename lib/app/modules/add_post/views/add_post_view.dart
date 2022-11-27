import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/post_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker_plus/image_picker_plus.dart';

import '../../../../core/resourses/font_manger.dart';
import '../../../routes/app_pages.dart';
import '../controllers/add_post_controller.dart';

var height = 310;

class AddPostView extends GetView<AddPostController> {
  const AddPostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
        body: ListView(
      children: [
        const AddPostAppBar(),
        const UserInfoWidget(),
        const PostTextField(),
        const ImageWidget(),
        Column(
          children: [
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (!isKeyboard) {
                return ColumnItem(controller);
              } else {
                return Column(
                  children: [
                    RowItem(controller),
                  ],
                );
              }
            })
          ],
        )
      ],
    ).paddingOnly(left: 10, right: 10, top: 30));
  }
}

class ImageWidget extends GetWidget<AddPostController> {
  const ImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.image.value.path != ''
        ? ClipRRect(
            child: Image.file(
              controller.image.value,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(CupertinoIcons.photo_fill_on_rectangle_fill),
              ),
            ).paddingSymmetric(horizontal: 20),
          )
        : const SizedBox());
  }
}

class PostTextField extends GetWidget<AddPostController> {
  const PostTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        controller: controller.postEditingController,
        minLines: 4,
        maxLines: 8,
        maxLength: 250,
        decoration: InputDecoration(
          counterStyle: getLightTextStyle(),
          filled: true,
          //helperText: "Hi this is a helper widget",
          fillColor: ColorsManger.light,
          hintText: 'what’s on your mind? ',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        onTap: () {},
      ),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage(UserService.myUser?.photoUrl ?? " "),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${UserService.myUser?.firstName} ${UserService.myUser?.lastName}',
              style:
                  getMediumTextStyle(fontSize: 14, color: ColorsManger.black),
            )
          ],
        ));
  }
}

class AddPostAppBar extends GetWidget<AddPostController> {
  const AddPostAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Iconsax.arrow_left,
                color: ColorsManger.black,
              )),
          const SizedBox(
            width: 10,
          ),
          Text('Create Post',
              style: getMediumTextStyle(
                fontSize: 16,
                color: ColorsManger.black,
              )),
          const Spacer(),
          Container(
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ColorsManger.primary,
            ),
            child: ButtonTheme(
              child: TextButton(
                onPressed: () async {
                  if (controller.postEditingController.text.isEmpty) {
                    Get.snackbar(
                        "Can't add an empty post", "Please write a post ",
                        snackPosition: SnackPosition.TOP);
                    return;
                  }
                  await controller.uploadPost().catchError((e) {
                    Get.snackbar('Error', e.toString());
                    BotToast.closeAllLoading();
                  });

                  await PostService.addPost(
                          PostModel(
                              title: controller.postEditingController.text,
                              user: UserService.myUser,
                              description:
                                  controller.postEditingController.text,
                              imageUrl: controller.imageUrl.value,
                              uid: UserService.myUser?.uid ?? ""),
                          UserService.myUser?.uid ?? "")
                      .catchError((e) => Get.snackbar('Error', e.toString()));

                  await Get.offNamedUntil(
                          Routes.BOTTOM_NAV_BAR, (route) => false)
                      ?.then((value) => Get.forceAppUpdate());
                },
                child: const Center(
                    child: Text(
                  'Post',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                )),
              ),
            ),
          ).paddingOnly(top: 10),
        ],
      ),
    );
  }
}

Widget ColumnItem(
  AddPostController controller,
) {
  return SingleChildScrollView(
      child: Column(
    children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Row(
            children: [
              SizedBox(
                height: 46,
                width: 46,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorsManger.light,
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
                onTap: () async {
                  await controller.addImageToPost(ImageSource.gallery);
                },
                child: Text(
                  'Media',
                  style: getRegularTextStyle(fontSize: FontSize.medium),
                ),
              )
            ],
          )),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Row(
            children: [
              SizedBox(
                height: 46,
                width: 46,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorsManger.light,
                  ),
                  child: const Icon(
                    Iconsax.camera,
                    color: ColorsManger.primary,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () async {
                  await controller.addImageToPost(ImageSource.camera);
                },
                child: Text(
                  'Camera',
                  style: getRegularTextStyle(fontSize: FontSize.medium),
                ),
              ),
            ],
          )),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Row(
            children: [
              SizedBox(
                height: 46,
                width: 46,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorsManger.light,
                  ),
                  child: const Icon(
                    Iconsax.user_tag,
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
                  'Tag people',
                  style: getRegularTextStyle(fontSize: FontSize.medium),
                ),
              ),
            ],
          )),
    ],
  ));
}

Widget RowItem(
  AddPostController controller,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
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
              Iconsax.gallery,
              color: ColorsManger.primary,
            ),
            onPressed: () async {
              await controller.addImageToPost(ImageSource.gallery);
            },
          ),
        ),
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
              Iconsax.camera,
              color: ColorsManger.primary,
            ),
            onPressed: () async {
              await controller.addImageToPost(ImageSource.camera);
            },
          ),
        ),
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
              Iconsax.user_tag,
              color: ColorsManger.primary,
            ),
            onPressed: () {},
          ),
        ),
      ),
    ],
  );
}
