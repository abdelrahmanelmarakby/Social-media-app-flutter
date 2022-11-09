import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets.dart';

class NoInternetDialog extends StatelessWidget {
  final bool canDismiss;

  const NoInternetDialog({Key? key, this.canDismiss = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(canDismiss);
      },
      child: AlertDialog(
        title: Row(
          children: [
            // Icon(Icons.not_interested, color: ColorsManger.darkGrey),
            SvgPicture.asset(
              Assets.images.noconnectionSVG,
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                "No internet connection",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        content: const Text(
          "Please check your internet connection as you can enjoy using app normally,This warning will disappear when you reconnect to the Internet",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
