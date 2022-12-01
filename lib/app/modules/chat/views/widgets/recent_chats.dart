import 'package:animations/animations.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/modules/profile/views/widget/contacts.dart';
import 'package:future_chat/core/services/contacts_service.dart';

import 'package:future_chat/core/services/encryption_service.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/font_manger.dart';
import '../../../../../core/resourses/values_manger.dart';
import '../../../../data/models/chat_model.dart';
import '../../../../routes/app_pages.dart';
import '../chat_screen.dart';

class RecentChats extends StatefulWidget {
  String myId;

  RecentChats({super.key, this.myId = ""});

  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  // UserModel? user;

  @override
  Widget build(BuildContext context) {
    final getRecentChat = Provider.of<List<ChatRoom>>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text('Chats',
            style: getBoldTextStyle(
              color: Colors.black,
              fontSize: 18,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: ColorsManger.primary,
            ),
          ),
          PopupMenuButton(
            onSelected: (value) async {
              if (value == 1) {
                Get.toNamed(Routes.GROUP_CHAT);
              } else if (value == 2) {
                Get.bottomSheet(ContactsView(
                    contacts: UserService.myUser?.following ?? []));
              } else if (value == 3) {
                BotToast.showLoading();
                await ContactsService.getAllRegisterdContacts().then((value) {
                  BotToast.closeAllLoading();
                  return Get.snackbar("All contact loaded", "Success",
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.green,
                      colorText: Colors.white);
                });
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 1,
                  child: Text(
                    'New Group',
                    style: getMediumTextStyle(
                      color: ColorsManger.black,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text(
                    'New Contact',
                    style: getMediumTextStyle(color: Colors.black),
                  ),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text(
                    'Refresh Contacts',
                    style: getMediumTextStyle(color: Colors.black),
                  ),
                ),
              ];
            },
            icon: const Icon(
              Icons.more_vert,
              color: ColorsManger.primary,
            ),
          )
        ],
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: getRecentChat.isNotEmpty ? getRecentChat.length : 0,
          padding: const EdgeInsets.only(top: 10),
          itemBuilder: (context, index) {
            final ChatRoom chatRoom = getRecentChat[index];

            return AnimationConfiguration.staggeredList(
                delay: const Duration(milliseconds: 100),
                duration: const Duration(milliseconds: 500),
                position: index,
                child: SlideAnimation(child: rowChat(context, chatRoom)));
          },
        ),
      ),
    );
  }

  /*getUser() async {
    user = await User(serverResponse: []).getUser();
  }*/

  Widget rowChat(BuildContext context, ChatRoom chatRoom) {
    return OpenContainer(
      openBuilder: (context, action) => ChatScreen(
        hisId: chatRoom.userA.toString() == widget.myId.toString()
            ? chatRoom.userB.toString()
            : chatRoom.userA.toString(),
        myId: widget.myId,
        myName: UserService.myUser?.firstName ?? "",
        myImage: UserService.myUser?.photoUrl ?? "",
        hisName: chatRoom.userA.toString() == widget.myId.toString()
            ? chatRoom.bName.toString()
            : chatRoom.aName.toString(),
        hisImage: chatRoom.userA.toString() == widget.myId.toString()
            ? chatRoom.bImage.toString()
            : chatRoom.aImage.toString(),
      ),
      closedBuilder: (context, action) => Container(
          margin: const EdgeInsets.only(top: 2, bottom: 4, right: 8, left: 8),
          padding: EdgeInsets.symmetric(
            horizontal: context.width * .04,
            vertical: context.width * .02,
          ),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(5, 5),
                )
              ],
              //TODO: ADD read and unread Colors
              color: chatRoom.lastSender != widget.myId
                  ? const Color.fromARGB(255, 219, 225, 252)
                  : const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(AppSize.size12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                        imageUrl: chatRoom.userA == widget.myId
                            ? chatRoom.bImage.toString()
                            : chatRoom.aImage.toString(),
                        fit: BoxFit.cover,
                        height: context.width * .2,
                        width: context.width * .2,
                        placeholder: (context, url) =>
                            const CupertinoActivityIndicator(
                                color: ColorsManger.primary),
                        errorWidget: (context, url, error) =>
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: ColorsManger.primary,
                              ),
                            )),
                  ),
                  SizedBox(
                    width: context.width * .05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          //    width: Dimensions.getDesirableWidth(45.0),
                          child: Text(
                        chatRoom.userA == widget.myId.toString()
                            ? chatRoom.bName.toString()
                            : chatRoom.aName.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: FontSize.xlarge,
                            color: ColorsManger.primary,
                            fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        height: context.width * (.1),
                      ),
                      SizedBox(
                          width: context.width * .35,
                          child: Text('${chatRoom.lastMsg?.decrypt}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: FontSize.small,
                                  color: ColorsManger.darkGrey,
                                  //           fontSize: Dimensions.getDesirableWidth(4),
                                  //          color: MyColors().textColor,
                                  fontWeight: FontWeight.w500))),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: context.width * .1,
                      height: context.height * .02,
                      //  height: Dimensions.getDesirableHeight(4.0),
                      //  width: Dimensions.getDesirableWidth(12.0),
                      child: chatRoom.lastSender != widget.myId
                          ? Container(
                              alignment: Alignment.centerLeft,
                              child: const Text('New!',
                                  style: TextStyle(
                                      // fontSize: Dimensions.getDesirableWidth(4),
                                      color: ColorsManger.success,
                                      fontWeight: FontWeight.bold)))
                          : const Text(''),
                    ),
                    SizedBox(
                      height: context.height * .05,
                    ),
                    Text(
                        timeago.format(
                            DateTime.now().subtract(DateTime.now()
                                .difference(chatRoom.lastChat!.toUtc())),
                            locale: 'ar'),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: FontSize.small,
                            color: ColorsManger.darkGrey,
                            //      fontSize: Dimensions.getDesirableWidth(4),
                            //    color: MyColors().textColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
