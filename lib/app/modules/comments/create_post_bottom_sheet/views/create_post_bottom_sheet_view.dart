import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/font_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../controllers/create_post_bottom_sheet_controller.dart';

class CreatePostBottomSheetView
    extends GetView<CreatePostBottomSheetController> {
  const CreatePostBottomSheetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            color: ColorsManger.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
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
                            Iconsax.magicpen,
                            color: ColorsManger.primary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
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
                        width: 15,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
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
                        width: 15,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
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
                        width: 15,
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
            ]),
      ),
    );
  }
}
