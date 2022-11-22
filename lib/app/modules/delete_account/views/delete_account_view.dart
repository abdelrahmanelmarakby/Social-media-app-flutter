import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/font_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../controllers/delete_account_controller.dart';

class DeleteAccountView extends GetView<DeleteAccountController> {
  const DeleteAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
              children: [

            ListTile(
              leading: const Icon(
                Iconsax.arrow_left,
                color: ColorsManger.black,
              ),
              title: GestureDetector(
              child: Text(
                'Delete My Account',
                style: getBoldTextStyle(
                  color: ColorsManger.black,
                ),
              ),
              onTap: () {
                Get.back();
              },)
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(width: 280,
              child: Text('to delete your account, write the following sentence and enter your phone number',
              style: getRegularTextStyle(fontSize: 16,
              color: ColorsManger.black),)).paddingOnly(left: 50),
              const SizedBox(height: 100,),
              Text('I confirm to delete my account',
              style: getRegularTextStyle(fontSize: 12,
              color: ColorsManger.black),),
              const SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50)
                ),
                child: TextFormField(
                minLines: 1,
                maxLines: 1,
                decoration: InputDecoration(
                  counterStyle: getLightTextStyle(),
                  filled: true,
                  fillColor: ColorsManger.light,
                  hintText: 'Re-write ',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: ColorsManger.light)
                  ),
                ),
                onTap: () {},
                        ),
              ),
              const SizedBox(height: 50,),
              Text('Enter your phone number',
              style: getRegularTextStyle(fontSize: 12,
              color: ColorsManger.black),),
              const SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50)
                ),
                child: TextFormField(
                minLines: 1,
                maxLines: 1,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  suffixIcon:const Icon(Iconsax.call) ,
                  counterStyle: getLightTextStyle(),
                  filled: true,
                  fillColor: ColorsManger.light,
                  hintText: '+20 ',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: ColorsManger.light)
                  ),
                ),
                onTap: () {},
                        ),
              ),
              const SizedBox(height: 170,),
              Container(
                height: 56,
                width: 342,
              decoration:  BoxDecoration(
                  color: ColorsManger.error,
              borderRadius: BorderRadius.circular(50)),
                child:TextButton(
                onPressed: () {

                },
                child: Text("Delete My Account",
                    style: getBoldTextStyle(fontSize: FontSize.medium,color: ColorsManger.white)),
              ) ,)
              ],),
        ),
      )

    );
  }
}
