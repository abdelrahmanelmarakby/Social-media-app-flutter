import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/notification_model.dart';
import 'package:future_chat/app/data/models/user_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/notification_services.dart';
import 'package:future_chat/core/resourses/font_manger.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../controllers/notifications_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification',
            style: getBoldTextStyle(
                color: ColorsManger.black, fontSize: FontSize.xlarge)),
        centerTitle: false,
        backgroundColor: ColorsManger.white,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: NotificationService.getAllNotifications(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Get.log(snapshot.data.toString());
            List<NotificationModel> notifications = [];
            for (var item in snapshot.data!.docs) {
              notifications.add(NotificationModel.fromMap(item.data()));
            }
            return Container(
              color: ColorsManger.light,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    return NotificationWidget(
                      body: notifications[index].body ?? "",
                      time: notifications[index].createdAt ?? DateTime.now(),
                      title: notifications[index].title ?? "",
                      type: notifications[index].type ?? "",
                      user: notifications[index].fromUser ?? SocialMediaUser(),
                    ).paddingOnly(left: 24, right: 24, bottom: 20);
                  },
                ),
              ),
            );
          } else {
            return const Center(child: CupertinoActivityIndicator());
          }
        },
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key? key,
    required this.title,
    required this.type,
    required this.body,
    required this.time,
    required this.user,
  }) : super(key: key);
  final String title;
  final String type;
  final String body;
  final DateTime time;
  final SocialMediaUser user;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorsManger.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.01),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 3))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          SizedBox(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.photoUrl ?? ""),
                  ),
                  title: Text(
                    "${user.firstName} ${user.lastName}",
                    style: getMediumTextStyle(
                        color: ColorsManger.black, fontSize: 16),
                  ),
                  subtitle: Wrap(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Iconsax.like_1,
                        color: ColorsManger.primary,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(title)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Row(
              children: [
                Text(
                  timeago.format(time),
                  style:
                      getLightTextStyle(fontSize: 12, color: ColorsManger.grey),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
