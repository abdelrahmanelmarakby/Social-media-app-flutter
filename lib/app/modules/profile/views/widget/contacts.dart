import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/user_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/color_manger.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key, required this.contacts}) : super(key: key);
  final List<String> contacts;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SocialMediaUser>>(
      future: UserService().getUsersByIds(contacts),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data?[index].firstName ?? ""),
                subtitle: Text(snapshot.data?[index].email ?? ""),
              );
            },
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
