import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/post_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../controllers/comments_controller.dart';

class CommentsView extends GetView<CommentsController> {
  const CommentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Comments',
                  style:
                      getBoldTextStyle(fontSize: 18, color: ColorsManger.black),
                ),
                IconButton(
                  icon: const Icon(Iconsax.close_circle),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ).paddingOnly(left: 8),
            Expanded(
                flex: 6,
                child: ListView.builder(
                    itemCount: controller.postModel.comments?.length ?? 0,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemBuilder: (context, index) {
                      List<Comment> comments =
                          controller.postModel.comments ?? [];
                      return Container(
                        decoration: BoxDecoration(
                            color: ColorsManger.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.05),
                                  spreadRadius: 5,
                                  blurRadius: 15,
                                  offset: const Offset(0, 3))
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    comments[index].user?.photoUrl ?? ""),
                              ),
                              title: Text(comments[index].user?.firstName ??
                                  " ${comments[index].user?.lastName}" ??
                                  ""),
                              subtitle: Text("${comments[index].comment}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 70),
                              child: Row(
                                children: [
                                  Text(
                                    timeago.format(comments[index].createdAt!),
                                    style: getLightTextStyle(
                                        fontSize: 12, color: ColorsManger.grey),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    child: Text(
                                      'Like',
                                      style: getLightTextStyle(
                                          fontSize: 12,
                                          color: ColorsManger.grey),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).paddingAll(
                        8,
                      );
                    })),
            Expanded(
              child: Container(
                height: 200,
                padding: const EdgeInsets.only(left: 8),
                color: ColorsManger.white,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(UserService
                              .myUser?.photoUrl ??
                          "" ??
                          "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"),
                    ),
                    Expanded(
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: ColorsManger.white,
                          hintText: 'add a comment',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onTap: () {
                          PostService.updatePost(controller.postModel.id ?? "",
                              controller.postModel);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ).paddingSymmetric(vertical: 15, horizontal: 15),
      ),
    );
  }
}
