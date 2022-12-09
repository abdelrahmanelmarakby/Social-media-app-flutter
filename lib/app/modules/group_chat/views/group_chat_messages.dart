import 'package:animate_do/animate_do.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/group_chat_message.dart';
import 'package:future_chat/app/data/models/group_chat_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/app/modules/group_chat/controllers/group_chat_controller.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/services/chat/group/group_chat.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

class GroupChatMessagesScreen extends GetView<GroupChatController> {
  const GroupChatMessagesScreen({Key? key, required this.groupChat})
      : super(key: key);
  final GroupChatModel groupChat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManger.primary,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    groupChat.image ?? "",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    groupChat.name ?? "no name",
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    groupChat.lastMessage ?? "no message",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
        ),
        backgroundColor: ColorsManger.light,
        body: Column(
          children: [
            Expanded(
                child: StreamBuilder(
              stream: GroupChatService.getGroupChatMessages(groupChat.id!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<GroupChatMessage> messages = snapshot.data!;

                  return ListView.builder(
                      controller: controller.scrollController,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        List<Widget> userDetails = [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              messages[index].sender?.photoUrl ?? "",
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Iconsax.user,
                                  color: ColorsManger.primary,
                                );
                              },
                            ),
                          ),
                          Text(
                              "${messages[index].sender!.firstName!} ${messages[index].sender!.lastName!}",
                              style: const TextStyle(
                                  color: ColorsManger.primary, fontSize: 12)),
                        ];
                        return FadeInUp(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: messages[index].sender!.uid ==
                                      UserService.myUser!.uid
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        messages[index].sender!.uid ==
                                                UserService.myUser!.uid
                                            ? MainAxisAlignment.end
                                            : MainAxisAlignment.start,
                                    children: messages[index].sender!.uid ==
                                            UserService.myUser!.uid
                                        ? userDetails.reversed.toList()
                                        : userDetails,
                                  ),
                                ),
                                Bubble(
                                    nip: messages[index].sender!.uid ==
                                            UserService.myUser!.uid
                                        ? BubbleNip.rightTop
                                        : BubbleNip.leftTop,
                                    color: messages[index].sender!.uid ==
                                            UserService.myUser!.uid
                                        ? ColorsManger.primary
                                        : Colors.white,
                                    elevation: 5,
                                    child: Text(
                                      messages[index].text!,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: controller.messageController,
                    decoration: const InputDecoration(
                      hintText: "Type a message",
                      border: InputBorder.none,
                    ),
                  )),
                  IconButton(
                      onPressed: () async {
                        GroupChatService.sendChatMessage(
                            groupChatId: groupChat.id!,
                            groupChatMessage: GroupChatMessage(
                              groupChatId: groupChat.id!,
                              sender: UserService.myUser,
                              text: controller.messageController.text,
                              sentAt: DateTime.now(),
                              isLiked: false,
                              unread: true,
                            ));
                        controller.messageController.clear();
                        controller.scrollController.animateTo(
                            controller
                                .scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut);
                      },
                      icon: const Icon(
                        Icons.send,
                        color: ColorsManger.primary,
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
