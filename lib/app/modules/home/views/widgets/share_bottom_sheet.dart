import 'package:flutter/material.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: context.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    UserService.myUser?.photoUrl ?? '',
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  )),
              title: Text(UserService.myUser?.firstName ?? 'N/A'),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              minLines: 4,
              maxLines: 4,
              enableSuggestions: true,
              autocorrect: true,
              maxLength: 200,
              //autofocus: true,
              buildCounter: (BuildContext context,
                  {required int currentLength,
                  required bool isFocused,
                  required int? maxLength}) {
                return Text(
                  '$currentLength/$maxLength',
                  style: const TextStyle(color: ColorsManger.lightGrey),
                );
              },
              decoration: const InputDecoration(
                hintText: 'What\'s on your mind?',
                hintStyle: TextStyle(color: ColorsManger.lightGrey),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: ColorsManger.primary.withOpacity(.1),
                child: const Icon(Iconsax.story),
              ),
              title: const Text('Share to your story'),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: ColorsManger.primary.withOpacity(.1),
                child: const Icon(Iconsax.message),
              ),
              title: const Text('Send in Chat'),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: ColorsManger.primary.withOpacity(.1),
                child: const Icon(Iconsax.user),
              ),
              title: const Text('Share in Group'),
            ),
            const SizedBox(height: 8.0),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: ColorsManger.primary.withOpacity(.1),
                child: const Icon(Iconsax.copy),
              ),
              title: const Text('Copy Link'),
            ),
          ],
        ),
      ),
    );
  }
}
