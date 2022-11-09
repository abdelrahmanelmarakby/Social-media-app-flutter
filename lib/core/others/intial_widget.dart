import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:future_chat/app/data/models/user_model.dart';
import 'package:future_chat/app/data/remote_firebase_services/user_services.dart';
import 'package:future_chat/app/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:future_chat/app/modules/intro/views/intro_view.dart';
import 'package:get/get.dart';

import '../../app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';

class CheckSigningIn extends StatefulWidget {
  const CheckSigningIn({Key? key}) : super(key: key);

  @override
  State<CheckSigningIn> createState() => _CheckSigningInState();
}

class _CheckSigningInState extends State<CheckSigningIn> {
  late FirebaseAuth _auth;

  User? _user;
  SocialMediaUser? _mediaUser;
  Future<SocialMediaUser?>? _futureMediaUser;
  bool isLoading = true;
  Future<SocialMediaUser?> getUser() async {
    _mediaUser = await UserService().getProfile(_user!.uid);
    Get.log("My profile name ${_mediaUser?.firstName}");
    return _mediaUser;
  }

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
    if (_user != null) {
      _futureMediaUser = getUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureMediaUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserService.myUser = snapshot.data as SocialMediaUser;
          // Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
          BottomNavBarController controller = Get.put(BottomNavBarController());
          return const BottomNavBarView();
        } else {
          // Get.offAllNamed(Routes.INTRO);

          return const IntroView();
        }
      },
    );
  }
}
