import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/font_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../controllers/other_profile_controller.dart';

class OtherProfileView extends GetView<OtherProfileController> {
  const OtherProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
          const SizedBox(
            height: 80,
            width: 80,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                "https://picsum.photos/${(100) + 500}",
              ),
            ),
          ),
          Text(
            'Nada Ahmed',
            style: getMediumTextStyle(color: ColorsManger.black, fontSize: 20),
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
                      icon:  const Icon(
                        Iconsax.more,
                        color: ColorsManger.primary)
                      ,itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: '1',
                          child: const Text('Share'),
                          onTap: () {}),
                          PopupMenuItem<String>(
                          value: '2',
                          child: const Text('View in contact'),
                          onTap: () {}),
                      ])
                  ),
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
            child:  Column(
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
                  ).paddingOnly(left: 24,top: 10),
                  Text(
                    '01094959669',
                    style: getMediumTextStyle(
                        color: ColorsManger.black, fontSize: 16),
                  ).paddingOnly(left: 27),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 95,
                          width: 95,
                          child: Padding(
                              padding: const EdgeInsets.only(right: 5,left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "https://picsum.photos/${(index * 100) + 500}",
                                    ),
                                  ),
                                ],
                              )),
                        );
                      }),),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,top:0,bottom: 100),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 0,),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 46,
                                  width: 46,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
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
                                    style: getMediumTextStyle(fontSize: 16),
                                  ),
                                )
                              ],
                            )),
                      const SizedBox(height: 20,),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 0,),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 46,
                            width: 46,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
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
                              style: getMediumTextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      )),
                    const SizedBox(height: 20,),

                  Padding(
                      padding: const EdgeInsets.only(
                          left: 0, ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 46,
                            width: 46,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
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
                              style: getMediumTextStyle(fontSize: 16),
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
      )),
    );
  }
}
