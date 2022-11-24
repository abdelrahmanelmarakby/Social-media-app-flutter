import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/post_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/post_services.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/app/modules/comments/views/comments_view.dart';
import 'package:future_chat/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../../../../routes/app_pages.dart';
import 'reaction_button.dart';
import 'share_bottom_sheet.dart';
import 'package:insta_like_button/insta_like_button.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:rich_text_view/rich_text_view.dart';

class PostList extends GetWidget<HomeController> {
  const PostList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Directionality(
        textDirection: TextDirection.ltr,
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
              controller.posts.clear();
              snapshot.data?.docs.map((e) {
                controller.posts.add(PostModel.fromMap(e.data()));
              }).toList();
              return Column(
                children: List.generate(controller.posts.length, (index) {
                  if (controller.posts[index].sharedFrom != null) {
                    return Column(
                      children: [
                        ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              controller.posts[index].user?.photoUrl ?? '',
                              fit: BoxFit.cover,
                              width: 30,
                              height: 30,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.error);
                              },
                            ),
                          ),
                          title: Text(
                              "${controller.posts[index].user?.firstName ?? ''} ${controller.posts[index].user?.lastName ?? ''}  Shared a Post",
                              style: getRegularTextStyle(fontSize: 14)),
                        ),
                        PostWidget(
                          index: index,
                          post: controller.posts[index],
                        )
                      ],
                    ).paddingSymmetric(vertical: 8);
                  } else {
                    return PostWidget(
                      index: index,
                      post: controller.posts[index],
                    ).paddingSymmetric(vertical: 8);
                  }
                }),
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: ColorsManger.black.withOpacity(.05),
              blurRadius: 10,
              spreadRadius: 1)
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          UserWidget(post: post),
          PostTitle(post: post),
          if (post.imageUrl != null && post.imageUrl != '')
            ImageWidget(post: post).paddingSymmetric(horizontal: 10),
          const SizedBox(height: 8.0),
          InteractionsWidget(post: post),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    ).paddingSymmetric(horizontal: 8);
  }
}

class PostTitle extends StatelessWidget {
  const PostTitle({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: RichTextView(
        text: post.title ?? '',
        selectable: true,
        viewMoreText: "see more",
        onEmailClicked: (email) => launchUrl(Uri.parse("mailto:$email"),
            mode: LaunchMode.externalApplication),
        onHashTagClicked: (hashtag) => print('is $hashtag trending?'),
        onUrlClicked: (url) =>
            launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
        onPhoneClicked: (phone) =>
            launchUrl(Uri.parse(phone), mode: LaunchMode.externalApplication),
        truncate: true,
        maxLines: 5,
        viewLessText: "see less",
        supportedTypes: const [
          ParsedType.EMAIL,
          ParsedType.HASH,
          ParsedType.URL,
          ParsedType.BOLD,
          ParsedType.PHONE,
        ],
        linkStyle: const TextStyle(color: Colors.blue),
        style: const TextStyle(
          color: ColorsManger.grey,
        ),
      ),
    );
  }
}

class InteractionsWidget extends StatelessWidget {
  const InteractionsWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ReactionButton(
            reactionCount: post.reactions?.length ?? 0,
            reactions: post.reactions ?? [],
            post: post,
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                  CommentsView(
                    post: post,
                  ),
                  transition: Transition.downToUp);
            },
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorsManger.primary.withOpacity(.05)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Iconsax.message,
                        color: ColorsManger.primary,
                      ),
                    )),
                const SizedBox(
                  width: 5,
                ),
                Text((post.comments?.length ?? 0).toString(),
                    style: getRegularTextStyle(
                        fontSize: 12, color: ColorsManger.grey))
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Get.bottomSheet(
              ShareBottomSheet(
                post: post,
              ),
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: true,
              elevation: 0,
              isDismissible: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
              ),
            ),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: ColorsManger.primary.withOpacity(.05),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Iconsax.export,
                      color: ColorsManger.primary,
                    ).paddingAll(8)),
                const SizedBox(
                  width: 5,
                ),
                const Text('Share'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.OTHER_PROFILE,
              arguments: {'userId': post.user?.uid});
        },
        child: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            post.user?.photoUrl ?? '',
          ),
        ),
      ),
      title: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.OTHER_PROFILE,
              arguments: {'userId': post.user?.uid});
        },
        child: Text('${post.user?.firstName} ${post.user?.lastName}',
            style: getMediumTextStyle(color: ColorsManger.black, fontSize: 14)),
      ),
      subtitle: Text(
          timeago.format(
            post.createdAt!,
            locale: 'en',
          ),
          style: getMediumTextStyle(color: ColorsManger.grey, fontSize: 12)),
      trailing: PopupMenuButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
          PopupMenuItem(
              child: Text(
            'Unfollow ${post.user?.firstName} ${post.user?.lastName} posts',
            style: getMediumTextStyle(fontSize: 11, color: ColorsManger.grey),
          )),
          PopupMenuItem(
              child: Text(
            'Report post',
            style: getMediumTextStyle(fontSize: 11, color: ColorsManger.grey),
          )),
          PopupMenuItem(
              value: 3,
              onTap: () async {
                await AppinioSocialShare().shareToFacebook(
                  post.postUrl ?? '',
                  post.postUrl ?? '',
                );

                await AppinioSocialShare().shareToInstagramFeed(
                  post.postUrl ?? '',
                );

                await AppinioSocialShare().shareToSystem(
                  post.postUrl ?? '',
                  post.postUrl ?? '',
                );
                await AppinioSocialShare().shareToFacebook(
                  post.postUrl ?? '',
                  post.postUrl ?? '',
                );
                await AppinioSocialShare().shareToFacebook(
                  post.postUrl ?? '',
                  post.postUrl ?? '',
                );

                print('share');
              },
              child: Text(
                'Copy link',
                style:
                    getMediumTextStyle(fontSize: 11, color: ColorsManger.grey),
              )),
          if (post.uid == UserService.myUser?.uid)
            PopupMenuItem(
                onTap: () async {
                  await PostService.deletePostToUser(postId: post.id!)
                      .then((value) => Get.forceAppUpdate());
                },
                child: Text(
                  'Delete',
                  style: getMediumTextStyle(
                      fontSize: 11, color: ColorsManger.grey),
                )),
        ],
        onSelected: (value) {
          if (value == 3) {
            Share.share('check out my website ${post.postUrl}',
                subject: 'Look what I made!');
          }
        },
        icon: const Icon(
          Icons.more_vert,
          color: ColorsManger.primary,
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GestureDetector(
        onTap: () {},
        onDoubleTap: () {},
        child: InstaImageViewer(
          child: InstaLikeButton(
            icon: Iconsax.like_15,
            iconColor: ColorsManger.primary,
            onChanged: () async {
              await PostService.addReactionToPost(
                  post.id ?? "",
                  Reaction(
                    createdAt: DateTime.now(),
                    user: UserService.myUser,
                    reaction: PostReactions.like.name,
                    postId: post.id,
                    uid: UserService.myUser?.uid,
                  ));
            },
            image: CachedNetworkImageProvider(
              post.imageUrl!,
            ),
            onImageError: (error, stackTrace) {
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
    );
  }
}
