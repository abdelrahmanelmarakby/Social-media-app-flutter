import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService extends GetxService {
  final SharedPreferences prefs;
  SharedPrefService({required this.prefs});
  String? uid;

  Future<bool> saveUid(String uid) async {
    uid = uid;
    return await prefs.setString("Uid", uid);
  }

  String? getUid() {
    final String? accessUid = prefs.getString("Uid");
    if (accessUid != null && accessUid.isNotEmpty) {
      uid = accessUid;
      return accessUid;
    } else {
      return null;
    }
  }

  Future<bool> removeUid() async {
    uid = null;
    return prefs.remove("Uid");
  }

  Future<bool> saveLocale(String langCode) async {
    return await prefs.setString("lang", langCode);
  }

  String loadLocale() {
    return prefs.getString("lang") ?? "en";
  }

  Future<bool> saveIsFirstTime() async {
    return await prefs.setBool("FirstTime", false);
  }

  bool loadIsFirstTime() {
    return prefs.getBool("FirstTime") ?? true;
  }
}
