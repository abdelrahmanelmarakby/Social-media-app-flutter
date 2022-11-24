import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

class ShareToBottomSheet extends StatelessWidget {
  const ShareToBottomSheet(
      {Key? key, required this.url, required this.promotionText})
      : super(key: key);
  final String url;
  final String promotionText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(crossAxisCount: 3, children: [
        ShareWidget(
          icon: FontAwesomeIcons.facebook,
          title: 'Share to Facebook',
          onTap: () {
            AppinioSocialShare().shareToFacebook(promotionText, url);
          },
        ),
        ShareWidget(
          icon: FontAwesomeIcons.twitter,
          title: 'Share to Twitter',
          onTap: () {
            Share.share('check out my website $url', subject: promotionText);
          },
        ),
      ]),
    );
  }
}

class ShareWidget extends StatelessWidget {
  ShareWidget({Key? key, required this.title, required this.icon, this.onTap})
      : super(key: key);
  final String title;
  final IconData icon;
  final void Function()? onTap;

  AppinioSocialShare appinioSocialShare = AppinioSocialShare();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          Text(title),
        ],
      ),
    );
  }
}
