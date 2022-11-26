import 'package:encrypt/encrypt.dart';

class EncryptionService {
  // ...
  final String _secureKey = "n/xvGNLpJlP2z5Emxkat7Hglh5bFUBiHZQ+AbE8XSlo=";
  String encrypt(String text) {
    final key = Key.fromUtf8(_secureKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  String decrypt(String text) {
    final key = Key.fromUtf8(_secureKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt64(text, iv: iv);
    return decrypted;
  }
}

extension EncryptionExtension on String? {
  String encrypt() {
    return EncryptionService().encrypt(this!);
  }

  String decrypt() {
    return EncryptionService().decrypt(this!);
  }
}

extension EncryptExtension on String {
  String encrypt() {
    return EncryptionService().encrypt(this);
  }

  String decrypt() {
    return EncryptionService().decrypt(this);
  }
}
