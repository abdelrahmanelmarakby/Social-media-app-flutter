import 'package:flutter/material.dart';
import 'package:future_chat/app/modules/contact_us/views/contact_us_view.dart';
import 'package:future_chat/app/modules/other_profile/views/other_profile_view.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/services/chat/private/private_chat.dart';
import '../../../data/models/private_chat_message.dart';
import '../../../routes/app_pages.dart';
import '../../video_chat/views/video_chat_view.dart';
import 'widgets/attachment.dart';
import 'widgets/build_msg.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  String myId, hisId, hisName, hisImage, myName, myImage;

  ChatScreen(
      {super.key,
      this.myId = '',
      this.hisId = '',
      this.hisName = '',
      this.hisImage = '',
      this.myImage = '',
      this.myName = ''});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PrivateMessage>>.value(
      value: PrivateChatService(
        hisId: hisId,
        myId: myId,
      ).getLivePrivateMessage,
      initialData: const [],
      child: ChatScreenX(
        myId: myId,
        hisId: hisId,
        hisName: hisName,
        myImage: myImage,
        myName: myName,
        hisImage: hisImage,
      ),
    );
  }
}

class ChatScreenX extends StatelessWidget {
  String myId, hisId, hisName, hisImage, myName, myImage;

  ChatScreenX(
      {this.myId = '',
      this.hisId = '',
      this.hisName = '',
      this.hisImage = '',
      this.myImage = '',
      this.myName = ''});

  @override
  Widget build(BuildContext context) {
    final getFluffs = Provider.of<List<PrivateMessage>>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFCAF0F8).withOpacity(.3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0.0,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                hisImage,
                height: 30,
                width: 30,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Iconsax.user,
                    color: Colors.black,
                  );
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                hisName,
                overflow: TextOverflow.fade,
                style: getMediumTextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Iconsax.video,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VideoChatView()));
            },
          ),
          IconButton(
            icon: const Icon(
              Iconsax.call,
              color: Colors.black,
            ),
            onPressed: () {
              Get.toNamed(Routes.VIDEO_CHAT);
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text('View Contact'),
                  onTap: () {
                    Get.to(() => const OtherProfileView(),
                        arguments: {'userId': hisId});
                  },
                ),
                PopupMenuItem(
                  child: const Text('Report'),
                  onTap: () {
                    Get.to(() => const ContactUsView());
                  },
                ),
                const PopupMenuItem(
                  child: Text('Clear Chat'),
                ),
                // PopupMenuItem(
                //   onTap: () {
                //     Get.dialog(
                //       AlertDialog(
                //         title: const Text('Report Chat'),
                //         content: const Text(
                //             'Are you sure you want to report this chat?'),
                //         actions: [
                //           TextButton(
                //             onPressed: () {
                //               Get.back();
                //             },
                //             child: const Text('Cancel'),
                //           ),
                //           TextButton(
                //             onPressed: () {
                //               Get.back();
                //             },
                //             child: const Text('report'),
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                //   child: const Text('Report'),
                // ),
              ];
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: getFluffs != null ? getFluffs.length : 0,
                  //padding: const EdgeInsets.only(
                  //  bottom: Dimensions.getDesirableHeight(2.2),
                  //  right: Dimensions.getDesirableHeight(1.2),
                  // left: Dimensions.getDesirableHeight(1.2),
                  // top: Dimensions.getDesirableHeight(2.2)),
                  // ),
                  itemBuilder: (context, index) {
                    final PrivateMessage? old = index != getFluffs.length - 1
                        ? getFluffs[index + 1]
                        : null;
                    final PrivateMessage msg = getFluffs[index];
                    bool isMe = msg.sender == myId;
                    return Column(
                      children: [
                        if (((old != null) &&
                                (msg.time?.day != old.time?.day ||
                                    msg.time?.month != old.time?.month)) ||
                            (index == getFluffs.length - 1))
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Card(
                                color: ColorsManger.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Text(
                                    '${msg.time?.day}/${msg.time?.month}/${msg.time?.year}',
                                    style: const TextStyle(
                                        color: ColorsManger.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                )),
                          )
                        else
                          const SizedBox(),
                        MessageBuilder(
                          msg: msg,
                          isMe: isMe,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Attachment(
                myId: myId,
                hisId: hisId,
                hisName: hisName,
                hisImage: hisImage,
                myImage: myImage,
                myName: myName,
              ).messageComposer(context),
            ],
          ),
        ),
      ),
    );
  }
}
