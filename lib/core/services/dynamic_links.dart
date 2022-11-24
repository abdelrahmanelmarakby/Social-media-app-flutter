import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';

class DynamicLinkService extends GetxService {
  bool initialURILinkHandled = false;
  Future<Uri?> createDynamicLink(String path, String id) async {
    try {
      final DynamicLinkParameters parameters = DynamicLinkParameters(
        uriPrefix: 'https://futurechat.page.link',
        link: Uri.parse('https://futurechat.page.link/path=$path&id=$id'),
        androidParameters: AndroidParameters(
          packageName: 'com.metamisr.future_chat',
          minimumVersion: 1,
          fallbackUrl: Uri.parse('https://fb.com/elmarakbeno'),
        ),
        iosParameters: IOSParameters(
          bundleId: 'your_ios_bundle_identifier',
          minimumVersion: '1',
          appStoreId: 'com.metamisr.future_chat',
          fallbackUrl: Uri.parse('https://fb.com/elmarakbeno'),
        ),
        socialMetaTagParameters: SocialMetaTagParameters(
            title: 'Future Chat',
            description: 'Chat with your friends! simple , easy and secure',
            imageUrl: Uri.parse(
                "https://firebasestorage.googleapis.com/v0/b/futurechat.appspot.com/o/appSecureData%2Flogo.png?alt=media&token=e7a32bcd-4cc7-472d-9347-b86dcfee896e")),
      );
      final ShortDynamicLink shortLink = await FirebaseDynamicLinks.instance
          .buildShortLink(parameters,
              shortLinkType: ShortDynamicLinkType.unguessable)
          .catchError((e) {
        print(e);
      });
      return shortLink.shortUrl;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
