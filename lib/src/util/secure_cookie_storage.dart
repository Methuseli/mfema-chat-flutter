import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCookieStorage implements Storage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> delete(String key) async{
    await _secureStorage.delete(key: key);
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    _secureStorage.deleteAll();
  }

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {
    // throw UnimplementedError();
  }

  @override
  Future<String?> read(String key) async{
    String? value = await _secureStorage.read(key: key);
    return value;
  }

  @override
  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

}
