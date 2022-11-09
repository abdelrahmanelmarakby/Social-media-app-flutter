import 'package:flutter/material.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          ProfileHeader(),
          Divider(),
          ProfileStats(),
          Divider(),
          ProfileInfo(),
          Divider(),
          ProfilePosts()
        ],
      ),
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Text("Stories"),
            Text((UserService.myUser?.stories?.length ?? 0).toString())
          ],
        ),
        Column(
          children: [
            const Text("Posts"),
            Text((UserService.myUser?.posts?.length ?? 0).toString())
          ],
        ),
        Column(
          children: [
            const Text("Comments"),
            Text((UserService.myUser?.comments?.length ?? 0).toString())
          ],
        ),
        Column(
          children: [
            const Text("Followers"),
            Text((UserService.myUser?.followers ?? 0).toString())
          ],
        ),
        Column(
          children: [
            const Text("Following"),
            Text((UserService.myUser?.following ?? 0).toString())
          ],
        ),
      ],
    ).paddingSymmetric(vertical: 12);
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.transparent,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            UserService.myUser?.photoUrl ?? '',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      width: double.infinity,
      color: Colors.transparent,
      child: Center(
        child: Column(
          children: [
            ProfileTile(
              title: 'Name',
              subtitle:
                  '${UserService.myUser?.firstName} ${UserService.myUser?.lastName}',
            ),
            ProfileTile(
              title: 'Email',
              subtitle: UserService.myUser?.email ?? 'No Email',
            ),
            ProfileTile(
              title: 'Phone',
              subtitle: UserService.myUser?.phoneNumber ?? 'No Phone',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePosts extends StatelessWidget {
  const ProfilePosts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Posts"),
      ],
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({Key? key, required this.title, required this.subtitle})
      : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
          style: getRegularTextStyle(fontSize: 14, color: Colors.grey)),
      subtitle: Text(
        subtitle,
        style: getMediumTextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
