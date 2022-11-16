import 'package:flutter/material.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/font_manger.dart';
import '../controllers/add_post_controller.dart';

var height = 310;

class AddPostView extends GetView<AddPostController> {
  const AddPostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom!=0;

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
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
              const SizedBox(
                width: 120,
              ),
              Container(
                width: 75,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorsManger.primary,
                ),
                child: ButtonTheme(
                  child: TextButton(
                    onPressed: () {},
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
        ),
        Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                const SizedBox(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("https://picsum.photos/400"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Refaat Mohamed',
                  style: getMediumTextStyle(
                      fontSize: 14, color: ColorsManger.black),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: Container(
            width: 347,
            height: 131,
            decoration: BoxDecoration(
                color: ColorsManger.light,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      offset: const Offset(1, -2),
                      blurRadius: 5),
                  BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      offset: const Offset(-1, 2),
                      blurRadius: 5)
                ]),
            child: SizedBox(
              height: 131,
              width: 347,
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: true,
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
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (!isKeyboard) {
                return ColumnItem();
              } else {
                return RowItem();
              }
            })
          ],
        )
      ],
    ).paddingOnly(left: 10, right: 10, top: 30));
  }
}

Widget ColumnItem() {
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
                onTap: () {},
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
                onTap: () {},
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
                    Iconsax.video,
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
                  'Live video',
                  style: getRegularTextStyle(fontSize: FontSize.medium),
                ),
              ),
            ],
          )),
    ],
  ));
}

Widget RowItem() {
  return Expanded(
      child: Row(
    children: [
      const SizedBox(
        width: 20,
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
              Iconsax.gallery,
              color: ColorsManger.primary,
            ),
            onPressed: () {},
          ),
        ),
      ),
      const SizedBox(
        width: 50,
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
            onPressed: () {},
          ),
        ),
      ),
      const SizedBox(
        width: 50,
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
      const SizedBox(
        width: 50,
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
    ],
  ));
}
