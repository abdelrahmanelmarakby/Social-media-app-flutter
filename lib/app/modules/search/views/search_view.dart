import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/user_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/core/resourses/color_manger.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: ColorsManger.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<List<SocialMediaUser?>>(
        future:
            UserService().getUsersByIds(UserService.myUser?.following ?? []),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //controller.users.value = snapshot.data;
            controller.users = snapshot.data!;
            return GetBuilder<SearchController>(
              builder: (_) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        controller.users = controller.getUsersByName(
                            snapshot.data ?? [], value);
                        controller.update();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    controller.selectedUsers.isNotEmpty
                        ? SizedBox(
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.selectedUsers.length,
                              itemBuilder: (context, index) => FadeIn(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorsManger.primary,
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                          controller.selectedUsers[index]
                                                  ?.photoUrl ??
                                              "",
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(
                                              Iconsax.user,
                                              color: Colors.white,
                                            );
                                          },
                                          loadingBuilder:
                                              (context, child, loading) {
                                            if (loading == null) return child;
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${controller.selectedUsers[index]?.firstName ?? ""} ${controller.selectedUsers[index]?.lastName ?? ""}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      flex: 3,
                      child: ListView.builder(
                        itemCount: controller.users.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                controller.users[index]?.photoUrl ?? "",
                              ),
                            ),
                            title: Text(
                                "${controller.users[index]?.firstName} ${controller.users[index]?.lastName}"),
                            subtitle: Text(
                                controller.users[index]?.phoneNumber ?? ""),
                            trailing: IconButton(
                              onPressed: () {
                                controller.selectUser(controller.users[index]);
                              },
                              icon: const Icon(Iconsax.add),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
