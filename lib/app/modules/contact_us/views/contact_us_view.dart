import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
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
              'Contact Us',
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
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Tell us how we can help you?',
            style: getMediumTextStyle(fontSize: 18, color: ColorsManger.black),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Message',
            style: getMediumTextStyle(fontSize: 14, color: ColorsManger.grey),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 300),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: TextFormField(
              minLines: 4,
              maxLines: 8,
              maxLength: 250,
              decoration: InputDecoration(
                counterStyle: getLightTextStyle(),
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
        Container(
          height: 56,
          width: 342,
          margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
          decoration: BoxDecoration(
              gradient: ColorsManger.buttonGradient,
              borderRadius: BorderRadius.circular(50),
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
          child: ButtonTheme(
            height: 50,
            child: TextButton(
              onPressed: () {},
              child: Center(
                  child: Text(
                "Send",
                style:
                    getBoldTextStyle(fontSize: 18, color: ColorsManger.white),
              )),
            ),
          ),
        ),
      ],
    ));
  }
}
