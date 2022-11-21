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
import '../../../../routes/app_pages.dart';
import 'reaction_button.dart';
import 'share_bottom_sheet.dart';
import 'package:insta_like_button/insta_like_button.dart';
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
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  if (posts[index].sharedFrom != null) {
                    return Column(
                      children: [
                        ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              posts[index].user?.photoUrl ?? '',
                              fit: BoxFit.cover,
                              width: 30,
                              height: 30,
                            ),
                          ),
                          title: Text(
                              "${posts[index].user?.firstName ?? ''} ${posts[index].user?.lastName ?? ''}  Shared a Post",
                              style: getRegularTextStyle(fontSize: 14)),
                        ),
                        PostWidget(
                          index: index,
                          post: posts[index],
                        )
                      ],
                    );
                  } else {
                    return PostWidget(
                      index: index,
                      post: posts[index],
                    );
                  }
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
          const Divider(
            color: ColorsManger.light,
            height: 15,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          )
        ],
      ),
    );
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
      child: Text(
        post.title ?? '',
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
        initialValue: 3,
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
              child: Text(
            'Copy link',
            style: getMediumTextStyle(fontSize: 11, color: ColorsManger.grey),
          )),
        ],
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
        child: InstaLikeButton(
          imageBoxfit: BoxFit.cover,
          icon: Iconsax.lovely,
          iconColor: ColorsManger.primary,
          onChanged: () {},
          image: NetworkImage(post.imageUrl!),
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
    );
  }
}
