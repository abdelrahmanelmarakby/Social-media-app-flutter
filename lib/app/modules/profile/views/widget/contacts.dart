import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/user_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/app/modules/chat/views/widgets/chat_screen.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key, required this.contacts}) : super(key: key);
  final List<String> contacts;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SocialMediaUser?>>(
      future: UserService().getUsersByIds(contacts),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            color: ColorsManger.white,
            height: context.height * 0.8,
            child: ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      snapshot.data?[index]?.photoUrl ?? '',
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Iconsax.user,
                        size: 50,
                      ),
                    ),
                  ),
                  title: Text(snapshot.data?[index]?.firstName ?? 'N/A'),
                  subtitle: Text(snapshot.data?[index]?.email ?? 'N/A'),
                  trailing: IconButton(
                    onPressed: () {
                      Get.log(
                          "Chatting with ${UserService.myUser?.phoneNumber?.replaceAll(RegExp("[^a-zA-Z0-9 ]"), "") ?? ""}");
                      Get.to(() => ChatScreen(
                            myId: UserService.myUser?.phoneNumber
                                    ?.replaceAll(RegExp("[^a-zA-Z0-9 ]"), "") ??
                                "",
                            hisId: snapshot.data?[index]?.phoneNumber
                                    ?.replaceAll(RegExp("[^a-zA-Z0-9 ]"), "") ??
                                "",
                            hisImage: snapshot.data?[index]?.photoUrl ?? "",
                            hisName: snapshot.data?[index]?.firstName ?? "",
                            myImage: UserService.myUser?.photoUrl ?? "",
                            myName: UserService.myUser?.firstName ?? "",
                          ));
                    },
                    icon: const Icon(
                      Iconsax.message,
                      color: ColorsManger.primary,
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Container(
            height: 100,
            color: ColorsManger.white,
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
      },
    );
  }
}
