import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/font_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification',
            style: TextStyle(
              fontSize: FontSize.xlarge,
              color: ColorsManger.black,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: ColorsManger.white,
        elevation: 0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            color: ColorsManger.light,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: ColorsManger.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.01),
                              spreadRadius: 5,
                              blurRadius: 15,
                              offset: const Offset(0, 3))
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage:
                                      NetworkImage('https://picsum.photos/400'),
                                ),
                                title: Text(
                                  'nada ahmed',
                                  style: getMediumTextStyle(
                                      color: ColorsManger.black, fontSize: 16),
                                ),
                                subtitle: Wrap(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Icon(
                                      Iconsax.like_1,
                                      color: ColorsManger.primary,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text('liked ypur post')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Row(
                            children: [
                              Text(
                                'yasterday at 2:30 Am',
                                style: getLightTextStyle(
                                    fontSize: 12, color: ColorsManger.grey),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ).paddingOnly(left: 24, right: 24, bottom: 20);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
