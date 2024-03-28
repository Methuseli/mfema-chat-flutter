
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

class CookieManager {
  static late CookieJar _cookieJar;

  static void initialize() async{
    Directory tempDir = await getTemporaryDirectory();

    final tempPath = tempDir.path;
    _cookieJar = PersistCookieJar(storage: FileStorage(tempPath));
  }

  static CookieJar get cookieJar => _cookieJar;

  static void saveCookies(Uri uri, List<String> setCookieHeaders) {
    List<Cookie> cookies = setCookieHeaders.map((e) => Cookie.fromSetCookieValue(e)).toList();
    _cookieJar.saveFromResponse(uri, cookies);
  }

  static Future<List<Cookie>> getRequestCookies(Uri uri) async {
    final List<Cookie> cookies = await _cookieJar.loadForRequest(uri);
    return cookies;
  }

}