import 'package:flutter/material.dart';
import 'package:future_chat/core/resourses/color_manger.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../core/resourses/styles_manger.dart';
import '../../controllers/signup_controller.dart';

class MobileNumberForm extends GetWidget<SignupController> {
  const MobileNumberForm({Key? key}) : super(key: key);
  //form key
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text("Enter your mobile number"),
            const SizedBox(
              height: 8,
            ),
            IntlPhoneField(
              autovalidateMode: AutovalidateMode.always,
              controller: controller.mobileNumberController,
              pickerDialogStyle: PickerDialogStyle(),
              keyboardType: TextInputType.phone,
              validator: (value) {
                String pattern = r'^01[0-2,5]{1}[0-9]{8}$';
                RegExp regExp = RegExp(pattern);
                if (value!.number.length < 10) {
                  return 'Please enter mobile number'.tr;
                } else if (!regExp.hasMatch(value.number)) {
                  return 'Please enter valid mobile number'.tr;
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Phone number".tr,
                  focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(color: Colors.green)),
                  fillColor: Colors.grey.shade50.withOpacity(.5),
                  filled: true,
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(6))),
              initialCountryCode: 'JO',
              onChanged: (phone) {
                controller.fullNumber = phone.completeNumber;
              },
            ),
            const Spacer(),
            Container(
              width: 342,
              height: 50,
              decoration: BoxDecoration(
                gradient: ColorsManger.buttonGradient,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.verifyPhone(controller.fullNumber);
                    controller.nextPage();
                  }
                },
                child: Text(
                  "Next",
                  style:
                      getBoldTextStyle(fontSize: 18, color: ColorsManger.white),
                ),
              ),
            ),
            const Spacer()
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}
