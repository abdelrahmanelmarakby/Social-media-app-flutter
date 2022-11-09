/*import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tinkle/core/utils/color_manger.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  //display notification
  AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: int.parse(message.data['id']),
    channelKey: 'tinkle_channel',
    bigPicture: message.data['image'],
    title: message.data['title'],
    body: "AWESOME NOTIFICATION",
    payload: message.data['payload'],
    displayOnForeground: true,
    displayOnBackground: true,
    wakeUpScreen: true,
    backgroundColor: ColorsManger.primary,
    color: Colors.white,
  ));
  print('onBackgroundMessage: $message');
}

class FCM {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final streamCtlr = StreamController<String>.broadcast();

  showNotification() {
    _firebaseMessaging
        .getInitialMessage()
        .then((message) => AwesomeNotifications().createNotification(
                content: NotificationContent(
              id: int.parse(message!.data['id']),
              channelKey: 'tinkle_channel',
              bigPicture: message.data['image'],
              title: message.data['title'],
              body: "AWESOME NOTIFICATION",
              payload: message.data['payload'],
              displayOnForeground: true,
              displayOnBackground: true,
              wakeUpScreen: true,
              backgroundColor: ColorsManger.primary,
              color: Colors.white,
            )));
  }

  setNotifications() {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
      (message) async {
        RemoteNotification? notification = message.notification;
        AndroidNotification? androidNotification =
            message.notification?.android;

        if (notification != null && androidNotification != null) {
          //display notification
          AwesomeNotifications().createNotification(
              content: NotificationContent(
            icon: androidNotification.smallIcon,
            id: int.parse(message.data['id']),
            channelKey: 'tinkle_channel',
            bigPicture: message.data['image'],
            title: message.data['title'],
            body: "AWESOME NOTIFICATION",
            payload: message.data['payload'],
            displayOnForeground: true,
            displayOnBackground: true,
            wakeUpScreen: true,
            backgroundColor: ColorsManger.primary,
            color: Colors.white,
          ));
        }
      },
    );
    // With this token you can test it easily on your phone
    final token =
        _firebaseMessaging.getToken().then((value) => print('Token: $value'));
  }

  dispose() {
    streamCtlr.close();
  }
}

class NotificationService {
  static Future<List<NotificationPermission>> requestUserPermissions(
      BuildContext context,
      {
      // if you only intends to request the permissions until app level, set the channelKey value to null
      required String? channelKey,
      required List<NotificationPermission> permissionList}) async {
    // Check if the basic permission was conceived by the user
    // if (!await requestBasicPermissionToSendNotifications(context)) return [];

    // Check which of the permissions you need are allowed at this time
    List<NotificationPermission> permissionsAllowed =
        await AwesomeNotifications().checkPermissionList(
            channelKey: channelKey, permissions: permissionList);

    // If all permissions are allowed, there is nothing to do
    if (permissionsAllowed.length == permissionList.length)
      return permissionsAllowed;

    // Refresh the permission list with only the disallowed permissions
    List<NotificationPermission> permissionsNeeded =
        permissionList.toSet().difference(permissionsAllowed.toSet()).toList();

    // Check if some of the permissions needed request user's intervention to be enabled
    List<NotificationPermission> lockedPermissions =
        await AwesomeNotifications().shouldShowRationaleToRequest(
            channelKey: channelKey, permissions: permissionsNeeded);

    // If there is no permissions depending on user's intervention, so request it directly
    if (lockedPermissions.isEmpty) {
      // Request the permission through native resources.
      await AwesomeNotifications().requestPermissionToSendNotifications(
          channelKey: channelKey, permissions: permissionsNeeded);

      // After the user come back, check if the permissions has successfully enabled
      permissionsAllowed = await AwesomeNotifications().checkPermissionList(
          channelKey: channelKey, permissions: permissionsNeeded);
    } else {
      // If you need to show a rationale to educate the user to conceived the permission, show it
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: Color(0xfffbfbfb),
                title: Text(
                  'Awesome Notificaitons needs your permission',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/animated-clock.gif',
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.fitWidth,
                    ),
                    Text(
                      'To proceede, you need to enable the permissions above' +
                          (channelKey?.isEmpty ?? true
                              ? ''
                              : ' on channel $channelKey') +
                          ':',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Text(
                      lockedPermissions
                          .join(', ')
                          .replaceAll('NotificationPermission.', ''),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Deny',
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      )),
                  TextButton(
                    onPressed: () async {
                      // Request the permission through native resources. Only one page redirection is done at this point.
                      await AwesomeNotifications()
                          .requestPermissionToSendNotifications(
                              channelKey: channelKey,
                              permissions: lockedPermissions);

                      // After the user come back, check if the permissions has successfully enabled
                      permissionsAllowed = await AwesomeNotifications()
                          .checkPermissionList(
                              channelKey: channelKey,
                              permissions: lockedPermissions);

                      Navigator.pop(context);
                    },
                    child: Text(
                      'Allow',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ));
    }

    // Return the updated list of allowed permissions
    return permissionsAllowed;
  }
}
*/