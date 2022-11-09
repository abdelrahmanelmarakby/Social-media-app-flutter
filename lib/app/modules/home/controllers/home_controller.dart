import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  addStory() {
    //pick image
    ImagePicker picker = ImagePicker();
    picker.pickImage(source: ImageSource.gallery).then((value) {
      //upload image

      //add story to database
    });

    //upload image
    //add story to user
  }
}
