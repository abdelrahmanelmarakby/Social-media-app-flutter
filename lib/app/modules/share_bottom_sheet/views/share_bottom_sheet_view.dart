import 'package:flutter/material.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/font_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/share_bottom_sheet_controller.dart';

class ShareBottomSheetView extends GetView<ShareBottomSheetController> {
  const ShareBottomSheetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: shareBottomSheet,
              child: const Text('Open'),
            )
          ],
        ),
      ),
    );
  }

    void shareBottomSheet() {
      Get.bottomSheet(
        SingleChildScrollView(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(left:21,top: 30),
                    child:Row(
                    children:  [
                    const SizedBox(height: 50,width: 50,
                      child:CircleAvatar() ,) ,
                    const SizedBox(width: 10,),
                    Text('Refaat Mohamed',
                      style:getMediumTextStyle(fontSize:FontSize.large),)
                    ],)),
              Padding(padding: const EdgeInsets.only(top:10,left: 22),
                child: Container(
                width: 339,
                height: 120,
                decoration: BoxDecoration(
                    color:ColorsManger.light,
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
                   ]
               ),
               child:Column(
                 children: [
                   const SizedBox(height: 5),
                   TextFormField(
                     decoration: const InputDecoration(
                       filled:true,
                       fillColor: Color(0xFFEFF4F8),
                       hintText: 'say Something',
                       border: InputBorder. none,
                       focusedBorder: InputBorder. none,
                       enabledBorder: InputBorder. none,
                       errorBorder: InputBorder. none,
                       disabledBorder: InputBorder. none,

                     ),
                   ),
                   Padding(padding: const EdgeInsets.only(left: 230,right: 7),
                       child:Container(
                         width: 88,height: 40,
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                           color:ColorsManger.primary,
                         ),
                         child:
                         ButtonTheme(
                           minWidth: 88,
                         child: TextButton(
                           onPressed: ()  {},
                           child: const Center(
                               child: Text(
                                 'Share',
                                 style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 14,
                                     fontWeight: FontWeight.normal),
                               )
                           ),
                         ),
                       ),
                       ),
                   ),

                 ],),
               ),
             ),

            const SizedBox(height: 5,),
            Padding(padding: const EdgeInsets.symmetric(horizontal:24,vertical: 15),
                child:Row(
                  children:  [
                    SizedBox(height: 46,width: 46,
                      child:Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                            color: ColorsManger.light,
                      ),
                        child:const Icon(Iconsax.story,
                          color: ColorsManger.primary,),
                      )
                      ,) ,
                    const SizedBox(width: 10,),
                    Text('share to tour story',
                      style:getRegularTextStyle(fontSize:FontSize.medium),)
                  ],)),
            const SizedBox(height: 5,),
            Padding(padding: const EdgeInsets.symmetric(horizontal:24,vertical: 15),
                child:Row(
                  children:  [
                    SizedBox(height: 46,width: 46,
                      child:Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                          color: ColorsManger.light,
                        ),
                        child:const Icon(Iconsax.message,
                          color: ColorsManger.primary,),
                      )
                      ,) ,
                    const SizedBox(width: 10,),
                    Text('send in chat',
                      style:getRegularTextStyle(fontSize:FontSize.medium),)
                  ],)),
            const SizedBox(height: 5,),
            Padding(padding: const EdgeInsets.symmetric(horizontal:24,vertical: 15),
                child:Row(
                  children:  [
                    SizedBox(height: 46,width: 46,
                      child:Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                          color: ColorsManger.light,
                        ),
                        child:const Icon(Iconsax.profile_2user,
                          color: ColorsManger.primary,),
                      )
                      ,) ,
                    const SizedBox(width: 10,),
                    Text('send to group',
                      style:getRegularTextStyle(fontSize:FontSize.medium),)
                  ],)),
            const SizedBox(height: 5,),
            Padding(padding: const EdgeInsets.symmetric(horizontal:24,vertical: 10),
                child:Row(
                  children:  [
                    SizedBox(height: 46,width: 46,
                      child:Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                          color: ColorsManger.light,
                        ),
                        child:const Icon(Iconsax.link,
                          color: ColorsManger.primary,),
                      )
                      ,) ,
                    const SizedBox(width: 10,),
                    Text('copy link',
                      style:getRegularTextStyle(fontSize:FontSize.medium),)
                  ],)),
          ]),),

        backgroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32)
          ),
        ),
      );
    }


}
