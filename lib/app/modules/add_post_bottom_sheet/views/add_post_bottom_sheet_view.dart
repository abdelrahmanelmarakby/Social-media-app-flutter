import 'package:flutter/material.dart';
import 'package:future_chat/app/modules/add_post/views/add_post_view.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/font_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/add_post_bottom_sheet_controller.dart';

class AddPostBottomSheetView extends GetView<AddPostBottomSheetController> {
  const AddPostBottomSheetView({Key? key}) : super(key: key);
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
                height: 25,
              ),
              Text('Add',
                  style: getBoldTextStyle(
                    fontSize: 20,
                    color: ColorsManger.black,
                  )).paddingOnly(right: 10),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const AddPostView());
                        },
                        child: Text(
                          'Add post',
                          style: getRegularTextStyle(fontSize: FontSize.medium),
                        ),
                      )
                    ],
                  )),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                            Iconsax.story,
                            color: ColorsManger.primary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(onTap:(){},
                      child:Text(
                        'Add story',
                        style: getRegularTextStyle(fontSize: FontSize.medium),
                      ) , )
                      ,
                    ],
                  )),
                  const SizedBox(height: 20,)
            ]),
      ),
    );
  }
}
