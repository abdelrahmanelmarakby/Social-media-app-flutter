import 'package:get/get.dart';

import '../../../data/models/user_model.dart';

class SearchController extends GetxController {
  List<SocialMediaUser?> users = [];
  List<SocialMediaUser?> selectedUsers = [];

  void selectUser(SocialMediaUser? user) {
    if (selectedUsers.contains(user)) {
      selectedUsers.remove(user);
    } else {
      selectedUsers.add(user);
    }
    update();
  }

  getUsersByName(List<SocialMediaUser?> users, String searchText) {
    return users.where((element) {
      return (element?.firstName?.toLowerCase().contains(searchText) ??
              false) ||
          (element?.lastName?.toLowerCase().contains(searchText) ?? false) ||
          (element?.phoneNumber?.toLowerCase().contains(searchText) ?? false) ||
          (element?.email?.toLowerCase().contains(searchText) ?? false);
    }).toList();
  }
}
