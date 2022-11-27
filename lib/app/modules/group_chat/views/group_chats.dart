import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/group_chat_model.dart';
import 'package:future_chat/app/modules/group_chat/controllers/group_chat_controller.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:future_chat/core/services/chat/group/group_chat.dart';
import 'package:get/get.dart';

class GroupChats extends GetView<GroupChatController> {
  const GroupChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Group Chats',
          style: TextStyle(color: ColorsManger.black),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorsManger.black,
          ),
        ),
        backgroundColor: ColorsManger.white,
        elevation: 0,
        centerTitle: false,
      ),
      backgroundColor: ColorsManger.light,
      body: StreamBuilder<List<GroupChatModel>>(
          stream: GroupChatService.getGroupChats(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<GroupChatModel> groupChats = snapshot.data!;
              return ListView.builder(
                  itemCount: groupChats.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(groupChats[index].image ?? ""),
                      ),
                      title: Text(
                        groupChats[index].name ?? "",
                        style: const TextStyle(
                            color: ColorsManger.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  });
            } else {
              return const Center(child: CupertinoActivityIndicator());
            }
          }),
    );
  }
}
