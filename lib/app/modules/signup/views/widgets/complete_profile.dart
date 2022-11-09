import 'package:flutter/material.dart';
import 'package:future_chat/app/modules/signup/controllers/signup_controller.dart';
import 'package:future_chat/core/resourses/font_manger.dart';
import 'package:future_chat/core/resourses/styles_manger.dart';
import 'package:get/get.dart';

class CompleteProfileForm extends GetWidget<SignupController> {
  const CompleteProfileForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          GestureDetector(
            onTap: () {
              controller.pickImage();
            },
            child: Column(
              children: [
                SizedBox(
                  height: 75,
                  width: 75,
                  child: Obx(
                    () => ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: controller.imagePicked.value
                            ? Image.file(
                                controller.image,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                fit: BoxFit.cover,
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                              )),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Upload Profile Picture",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            width: double.infinity,
            //height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: context.width * 0.45,
                  // height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "First Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: FontSize.medium,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: controller.firstName,
                        decoration: const InputDecoration(
                          hintText: 'First Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: context.width * 0.45,
                  // height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Last Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: FontSize.medium,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: controller.lastName,
                        decoration: const InputDecoration(
                          hintText: 'Last Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          //next button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                controller.nextPage();
              },
              child: Text(
                "Next",
                style: getBoldTextStyle(),
              ),
            ).paddingSymmetric(horizontal: 12),
          ),
          const Spacer(
            flex: 3,
          ),

          //const SizedBox(height: 8),
        ],
      ),
    );
  }
}
