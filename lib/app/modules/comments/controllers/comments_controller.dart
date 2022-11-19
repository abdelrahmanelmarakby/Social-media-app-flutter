import 'package:future_chat/app/data/models/post_model.dart';
import 'package:get/get.dart';

class CommentsController extends GetxController {
  final PostModel postModel = Get.arguments ?? PostModel();
}
