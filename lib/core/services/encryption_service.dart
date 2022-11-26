import 'package:encrypt/encrypt.dart';

class EncryptionService {
  // ...
  final String _secureKey = "n/xvGNLpJlP2z5Emxkat7Hglh5bFUBiHZQ+AbE8XSlo=";
  String encrypt(String text) {
    final key = Key.fromBase64(_secureKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  String decrypt(String text) {
    final key = Key.fromBase64(_secureKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final Encrypted encrypted = Encrypted.fromBase64(text);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }
}

extension EncryptionServiceX on String {
  bool get isEncrypted {
    return contains('==');
  }

  String get encrypt {
    return EncryptionService().encrypt(this);
  }

  String get decrypt {
    return EncryptionService().decrypt(this);
  }
}
