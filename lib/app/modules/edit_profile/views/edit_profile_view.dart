import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/font_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
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
              const SizedBox(width: 10,),
              Text('Edit Profile',
              style: getBoldTextStyle(
              color: ColorsManger.black,
              fontSize: 20,
          ),)
            ],),),
            const SizedBox(height: 20,),
            SizedBox(
              height: 150,width: 150,
              child: Stack(
                children: [
                  const SizedBox(height: 150,width:150,
                    child:  CircleAvatar(
                      backgroundImage: NetworkImage("https://picsum.photos/600"),
                  ),
                  ),
                  Positioned(right: 5,
                    bottom: 3,
                  child: SizedBox(width: 38,height: 38,
                  child:FloatingActionButton(
                    backgroundColor: ColorsManger.white,
                    onPressed: () {},
                    child: const Icon(Iconsax.camera,
                    color: ColorsManger.primary,size: 22,),
                  ) ,),
              ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50,left: 25),
                  child: Text('Name',
                  style: getMediumTextStyle(color: ColorsManger.grey,
                  fontSize: 14),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5,left: 25),
                  child: Text('Sara Ahmed',
                  style: getMediumTextStyle(color: ColorsManger.black,
                  fontSize: 18),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 25),
                  child: Text('About',
                  style: getMediumTextStyle(color: ColorsManger.grey,
                  fontSize: 14),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5,left: 25,bottom: 250),
                  child: Text('UX designer',
                  style: getMediumTextStyle(color: ColorsManger.black,
                  fontSize: 18),),
                ),
              ],),
            ),
            Container(
                height: 56,
                width: 342,
              decoration:  BoxDecoration(
                  gradient: ColorsManger.buttonGradient,
              borderRadius: BorderRadius.circular(50)),
                child:TextButton(
                onPressed: () {
                },
                child: Text("Save Changes",
                    style: getBoldTextStyle(fontSize: 18,color: ColorsManger.white)),
              ) ,).paddingOnly(bottom: 50),
        ],
      )),
    );
  }
}
