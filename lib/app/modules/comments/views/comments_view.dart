import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/notification_model.dart';
import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/notification_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/post_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../data/remote_firebase_services/notification_services.dart';
import '../../add_post/controllers/add_post_controller.dart';
import '../controllers/comments_controller.dart';

class CommentsView extends GetView<CommentsController> {
  CommentsView({Key? key, required this.post}) : super(key: key);
  final PostModel post;
  final TextEditingController _commentController = TextEditingController();
  //final AddPostController _postController = AddPostController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<List<Comment>>(
          stream: PostService().getComments(post.id ?? ""),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                //mainAxisSize: MainAxisSize.min,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Comments',
                        style: getBoldTextStyle(
                            fontSize: 18, color: ColorsManger.black),
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
                      flex: 1,
                      child: ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemBuilder: (context, index) {
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        if (snapshot
                                                .data?[index].commentImageUrl !=
                                            null)
                                          Image.network(
                                            snapshot.data?[index]
                                                    .commentImageUrl ??
                                                "",
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Icon(Icons.error);
                                            },
                                          ),
                                        ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                snapshot.data?[index].user
                                                        ?.photoUrl ??
                                                    ""),
                                          ),
                                          title: Text(snapshot.data?[index].user
                                                  ?.firstName ??
                                              " ${snapshot.data?[index].user?.lastName}"),
                                          subtitle: Text(
                                              "${snapshot.data?[index].comment}"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70),
                                    child: Row(
                                      children: [
                                        Text(
                                          timeago.format(
                                              snapshot.data?[index].createdAt ??
                                                  DateTime.now()),
                                          style: getLightTextStyle(
                                              fontSize: 12,
                                              color: ColorsManger.grey),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        GestureDetector(
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
                  Container(
                    height: 80,
                    padding: const EdgeInsets.only(left: 8),
                    color: ColorsManger.white,
                    child: Row(
                      children: [
                        ClipRRect(
                          child:
                              Image.network(UserService.myUser?.photoUrl ?? ""),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _commentController,
                            minLines: 1,
                            maxLines: 3,
                            onFieldSubmitted: (value) async {
                              if (value.isNotEmpty) {
                                await PostService.addCommentToPost(
                                        post.id ?? "",
                                        Comment(
                                            comment: value,
                                            user: UserService.myUser,
                                            createdAt: DateTime.now()))
                                    // .then((value) =>
                                    //     NotificationService.sendNotification(
                                    //         NotificationModel(
                                    //             title:
                                    //                 '${UserService.myUser?.firstName ?? ""} ${UserService.myUser?.lastName ?? ""} commented on your post',
                                    //             body: _postController
                                    //                         .postEditingController
                                    //                         .text
                                    //                         .length >
                                    //                     20
                                    //                 ? "${_postController.postEditingController.text.substring(0, 20)}..."
                                    //                 : _postController
                                    //                     .postEditingController
                                    //                     .text,
                                    //             fromUser: UserService.myUser,
                                    //             toUsers: UserService
                                    //                 .myUser?.followers,
                                    //             type: 'comments')))
                                    .then((value) => Get.forceAppUpdate());
                                _commentController.clear();
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorsManger.white,
                              hintText: 'Add a comment',
                              hintStyle: getMediumTextStyle(
                                  fontSize: 14, color: ColorsManger.grey),
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: () async {
                                  if (_commentController.text.isNotEmpty) {
                                    PostService.addCommentToPost(
                                            post.id ?? "",
                                            Comment(
                                                comment:
                                                    _commentController.text,
                                                user: UserService.myUser,
                                                createdAt: DateTime.now()))
                                        .then((value) {
                                      NotificationService.sendNotification(
                                          NotificationModel(
                                              title:
                                                  "New Comment by ${UserService.myUser?.firstName} ${UserService.myUser?.lastName}",
                                              body:
                                                  "New Comment on your post by ${UserService.myUser?.firstName}",
                                              fromUser: UserService.myUser,
                                              toUsers: [post.user?.uid ?? ""],
                                              type: "comment",
                                              createdAt: DateTime.now()));

                                      return Get.forceAppUpdate();
                                    });
                                    _commentController.clear();
                                  }
                                },
                                child: const Icon(Iconsax.send1),
                              ),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ).paddingSymmetric(vertical: 15, horizontal: 15);
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else {
              return const Center(child: CupertinoActivityIndicator());
            }
          },
        ),
      ),
    );
  }
}
