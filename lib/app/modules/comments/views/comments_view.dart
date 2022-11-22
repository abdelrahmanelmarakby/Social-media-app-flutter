import 'package:flutter/cupertino.dart';
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
  CommentsView({Key? key, required this.post}) : super(key: key);
  final PostModel post;
  final TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Comment>>(
          future: PostService().getComments(post.id ?? ""),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Comment> comments = snapshot.data as List<Comment>;
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
                          itemCount: post.comments?.length ?? 0,
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
                                        if (comments[index].commentImageUrl !=
                                            null)
                                          Image.network(
                                            comments[index].commentImageUrl ??
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
                                                comments[index]
                                                        .user
                                                        ?.photoUrl ??
                                                    ""),
                                          ),
                                          title: Text(comments[index]
                                                  .user
                                                  ?.firstName ??
                                              " ${comments[index].user?.lastName}"),
                                          subtitle: Text(
                                              "${comments[index].comment}"),
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
                                              comments[index].createdAt!),
                                          style: getLightTextStyle(
                                              fontSize: 12,
                                              color: ColorsManger.grey),
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
                  Container(
                    height: 80,
                    padding: const EdgeInsets.only(left: 8),
                    color: ColorsManger.white,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(UserService.myUser?.photoUrl ?? ""),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _commentController,
                            minLines: 1,
                            maxLines: 3,
                            onFieldSubmitted: (value) {
                              if (value.isNotEmpty) {
                                PostService.addCommentToPost(
                                    post.id ?? "",
                                    Comment(
                                        comment: value,
                                        user: UserService.myUser,
                                        createdAt: DateTime.now()));
                                _commentController.clear();
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorsManger.white,
                              hintText: 'Add a comment',
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: () async {
                                  PostService.addCommentToPost(
                                      post.id ?? "",
                                      Comment(
                                        comment: _commentController.text,
                                        user: UserService.myUser,
                                        createdAt: DateTime.now(),
                                      ));

                                  _commentController.clear();
                                  await PostService()
                                      .getComments(post.id ?? "");
                                  await Get.forceAppUpdate();
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
