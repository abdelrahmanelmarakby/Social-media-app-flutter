import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/post_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/app/modules/comments/views/comments_view.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import 'reaction_button.dart';
import 'share_bottom_sheet.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostList extends StatelessWidget {
  const PostList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Expanded(
        child: FutureBuilder(
          future: PostService().getAllUserPosts(
            [
              ...UserService.myUser?.following ?? [],
              UserService.myUser?.uid ?? '',
            ],
          ),
          builder: (context, snapshot) {
            //  Get.log("User Posts :$posts");
            if (snapshot.hasData) {
              List<PostModel> posts = [];
              snapshot.data?.docs.map((e) {
                posts.add(PostModel.fromMap(e.data() as Map<String, dynamic>));
              }).toList();
              Get.log("User Posts :$posts");
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return PostWidget(
                    index: index,
                    post: posts[index],
                  );
                },
              );
            } else {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key, required this.index, required this.post})
      : super(key: key);
  final int index;
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),

          // boxShadow: [
          // BoxShadow(
          // color: Colors.black.withOpacity(0.1),
          //  spreadRadius: 5,
          //  blurRadius: 10,
          //  offset: const Offset(0, 3), // changes position of shadow
          //),
          //],
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  post.user?.photoUrl ?? '',
                ),
              ),
              title: Text('${post.user?.firstName} ${post.user?.lastName}',
                  style: getBoldTextStyle(color: ColorsManger.black)),
              subtitle: Text(
                  timeago.format(
                    post.createdAt!,
                    locale: 'en',
                  ),
                  style: getMediumTextStyle(
                      color: ColorsManger.grey, fontSize: 12)),
              trailing: PopupMenuButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                initialValue: 3,
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                      child: Text(
                    'Unfollow ${post.user?.firstName} ${post.user?.lastName} posts',
                    style: getMediumTextStyle(
                        fontSize: 11, color: ColorsManger.grey),
                  )),
                  PopupMenuItem(
                      child: Text(
                    'Report post',
                    style: getMediumTextStyle(
                        fontSize: 11, color: ColorsManger.grey),
                  )),
                  PopupMenuItem(
                      child: Text(
                    'Copy link',
                    style: getMediumTextStyle(
                        fontSize: 11, color: ColorsManger.grey),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                post.title ?? '',
                style: const TextStyle(
                  color: ColorsManger.grey,
                ),
              ),
            ),
            if (post.imageUrl != null && post.imageUrl != '')
              FadeIn(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    post.imageUrl ?? '',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                          child: Column(
                        children: [
                          const Icon(
                            Iconsax.image4,
                            color: ColorsManger.error,
                          ),
                          Text(
                            'Error loading image',
                            style: getRegularTextStyle(
                                fontSize: 12, color: ColorsManger.error),
                          ).paddingOnly(bottom: 10)
                        ],
                      ));
                    },
                  ),
                ),
              ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: context.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ReactionButton(),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(
                        CommentsView(
                          post: post,
                        ),
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                      );
                    },
                    child: Row(
                      children: [
                        const CircleAvatar(
                            backgroundColor: ColorsManger.grey1,
                            child: Icon(Iconsax.message)),
                        const SizedBox(
                          width: 5,
                        ),
                        Text((post.comments?.length ?? 0).toString(),
                            style: getRegularTextStyle(
                                fontSize: 12, color: ColorsManger.grey))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.bottomSheet(
                      const ShareBottomSheet(),
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32)),
                      ),
                    ),
                    child: Row(
                      children: const [
                        CircleAvatar(
                            backgroundColor: ColorsManger.light,
                            child: Icon(Iconsax.export)),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Share'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            const Divider(
              color: ColorsManger.light,
              height: 20,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            )
          ],
        ),
      ).paddingAll(10),
    );
  }
}
