import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_chat/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';

class OtpVerificationLoginForm extends StatefulWidget {
  const OtpVerificationLoginForm({Key? key}) : super(key: key);

  @override
  State<OtpVerificationLoginForm> createState() => _OtpVerificationLoginForm();
}

class _OtpVerificationLoginForm extends State<OtpVerificationLoginForm> {
  LoginController controller = Get.find();
  final RxString _comingSms = 'Unknown'.obs;
  static final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  Future<void> initSmsListener() async {
    String? comingSms;
    try {
      comingSms = await AltSmsAutofill().listenForSms;
    } on PlatformException {
      comingSms = 'Failed to get SMS.';
    }

    _comingSms.value = comingSms!;
    otpController.text = _comingSms.value[0] +
        _comingSms.value[1] +
        _comingSms.value[2] +
        _comingSms.value[3] +
        _comingSms.value[4] +
        _comingSms.value[5];
    //controller.otpVerify(otpController.text);
  }

  @override
  void initState() {
    initSmsListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //decoration: backgroundBoxDectoration,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 38),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Phone Number Verification',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
            child: RichText(
              text: TextSpan(
                  text: "Enter the code sent to ",
                  children: [
                    TextSpan(
                        text: controller.fullNumber,
                        style: const TextStyle(
                            color: ColorsManger.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ],
                  style: const TextStyle(color: Colors.black54, fontSize: 15)),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
              key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  obscureText: false,
                  autoDisposeControllers: true,
                  autoFocus: true,
                  autoUnfocus: true,
                  autoDismissKeyboard: true,
                  animationType: AnimationType.slide,
                  backgroundColor: Colors.transparent,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      inactiveFillColor: Colors.white,
                      inactiveColor: Colors.grey.shade200,
                      selectedColor: Colors.grey.shade200,
                      selectedFillColor: Colors.white,
                      activeFillColor: Colors.white,
                      activeColor: Colors.green.shade200),
                  cursorColor: ColorsManger.primary,
                  textStyle: getBoldTextStyle(),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: false,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    controller.otpVerify(otpController.text);
                  },
                  onChanged: (String value) {},
                ),
              )),
          Container(
            height: 56,
            width: 342,
            margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
            decoration: BoxDecoration(
                gradient: ColorsManger.buttonGradient,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      offset: const Offset(1, -2),
                      blurRadius: 5),
                  BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      offset: const Offset(-1, 2),
                      blurRadius: 5)
                ]),
            child: ButtonTheme(
              height: 50,
              child: TextButton(
                onPressed: () async {
                  controller.otpVerify(otpController.text);
                },
                child: Center(
                    child: Text(
                  "VERIFY".toUpperCase(),
                  style:
                      getBoldTextStyle(fontSize: 18, color: ColorsManger.white),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
