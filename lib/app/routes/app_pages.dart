import 'package:get/get.dart';

import '../modules/add_post/views/add_post_view.dart';
import '../modules/add_post_bottom_sheet/bindings/add_post_bottom_sheet_binding.dart';
import '../modules/add_post_bottom_sheet/views/add_post_bottom_sheet_view.dart';
import '../modules/add_story/bindings/add_story_binding.dart';
import '../modules/add_story/views/add_story_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/bottom_nav_bar/bindings/bottom_nav_bar_binding.dart';
import '../modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import '../modules/create_post_bottom_sheet/bindings/create_post_bottom_sheet_binding.dart';
import '../modules/create_post_bottom_sheet/views/create_post_bottom_sheet_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/intro/bindings/intro_binding.dart';
import '../modules/intro/views/intro_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/other_profile/bindings/other_profile_binding.dart';
import '../modules/other_profile/views/other_profile_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/share_bottom_sheet/bindings/share_bottom_sheet_binding.dart';
import '../modules/share_bottom_sheet/views/share_bottom_sheet_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/video_chat/bindings/video_chat_binding.dart';
import '../modules/video_chat/views/video_chat_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => const BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => const IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.SHARE_BOTTOM_SHEET,
      page: () => const ShareBottomSheetView(),
      binding: ShareBottomSheetBinding(),
    ),
    GetPage(
      name: _Paths.ADD_POST,
      page: () => const AddPostView(),
    ),
    GetPage(
      name: _Paths.ADD_POST_BOTTOM_SHEET,
      page: () => const AddPostBottomSheetView(),
      binding: AddPostBottomSheetBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_POST_BOTTOM_SHEET,
      page: () => const CreatePostBottomSheetView(),
      binding: CreatePostBottomSheetBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.OTHER_PROFILE,
      page: () => const OtherProfileView(),
      binding: OtherProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_STORY,
      page: () => const AddStoryView(),
      binding: AddStoryBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_CHAT,
      page: () => const VideoChatView(),
      binding: VideoChatBinding(),
    ),
  ];
}
