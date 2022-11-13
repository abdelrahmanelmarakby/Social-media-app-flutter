import 'package:flutter/material.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/comments_controller.dart';

class CommentsView extends GetView<CommentsController> {

  const CommentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child:OutlinedButton(
          onPressed: getComments,
          child:  const Text('Open'),
        ),
      ),
    );
  }

   void getComments() {
    //List items=getCommentsList();
    Get.bottomSheet(
      enableDrag: true,
      DraggableScrollableSheet(
          initialChildSize:0.95 ,
          builder: (_,controller)=>Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Comments',style: getBoldTextStyle(fontSize: 18,
                        color: ColorsManger.black),),
                    IconButton(icon:const Icon(Iconsax.close_circle) ,
                      onPressed: (){Get.back();},),
                  ],) .paddingOnly(left: 8),
              Expanded(
                  flex: 6,
                  child: ListView.builder(itemCount: 10 ,
                      keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                      itemBuilder: (context,index){
                        return Container(
                          decoration: BoxDecoration(
                              color: ColorsManger.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.05),
                                    spreadRadius: 5,
                                    blurRadius: 15,
                                    offset: const Offset(0, 3)
                                )
                              ],
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child: Column(
                            children:  [
                              const ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage("https://picsum.photos/400"),
                                ),
                                title: Text("Jon Doe"),
                                subtitle: Text("Great shot, i love iconst t"),
                              ),
                              Padding(padding: const EdgeInsets.only(left: 70),child:
                              Row(children: [
                                Text('2 min',style: getLightTextStyle(fontSize: 12,
                                    color: ColorsManger.grey),),
                                const SizedBox(width: 20,),
                                InkWell(child: Text('Reply',style: getLightTextStyle(fontSize: 12,
                                    color: ColorsManger.grey),),
                                  onTap: (){},),
                                const SizedBox(width: 20,),
                                InkWell(child: Text('Like',style: getLightTextStyle(fontSize: 12,
                                    color: ColorsManger.grey),),
                                  onTap: (){},),
                              ],),),





                            ],),

                        ).paddingAll(8,);
                      })),
              Expanded(

                child:Container(
                  height: 200,
                  padding: const EdgeInsets.only(left: 8),
                  color: ColorsManger.white,
                  child:Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage("https://picsum.photos/400"),
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            filled:true,
                            fillColor: ColorsManger.white,
                            hintText: 'add a comment',
                            border: InputBorder. none,
                            focusedBorder: InputBorder. none,
                            enabledBorder: InputBorder. none,
                            errorBorder: InputBorder. none,
                            disabledBorder: InputBorder. none,
                          ),
                          onTap: (){},
                        ),
                      )
                    ],) ,)
                ,),

            ],),),




      backgroundColor: ColorsManger.light,
      elevation: 0,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16)
        ),
      ),

    );


  }

  List getCommentsList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }
}
