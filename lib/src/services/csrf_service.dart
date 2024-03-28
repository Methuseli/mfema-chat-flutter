// import 'dart:io';

// import 'package:cookie_jar/cookie_jar.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mfema_chat/src/util/constants.dart';
import 'package:mfema_chat/src/util/cookie_manager.dart';
// import 'package:path_provider/path_provider.dart';

class CsrfService {
  // final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  // Map<String, String> headers = {"content-type": "text/json"};
  // Map<String, String> cookies = {};

  static String url = "$host/csrf";


  Future<void> getCsrf() async {

    CookieManager.initialize();

    final response = await http.get(Uri.parse(url));
    List<String> setCookieHeaders = response.headers['set-cookie']?.split(',') ?? [];
    print('Cookies $setCookieHeaders');

    CookieManager.saveCookies(Uri.parse(url), setCookieHeaders);
  }

  // List<String> _getCSRFCookie(http.Response response) {
  //   String? allCookies = response.headers['set-cookie'];
  //   List<Cookie> responseCookies = [];
  //   if (allCookies != null)  {
  //     var setCookies = allCookies.split(',');
  //
  //     for (var setCookie in setCookies) {
  //       var cookies = setCookie.split(';');
  //
  //       for (var cookie in cookies) {
  //         if(cookie.isNotEmpty) {
  //           var keyValue = cookie.split('=');
  //           if(keyValue.length == 2) {
  //             var key = keyValue[0].trim();
  //             var value = key;
  //           }
  //         }
  //       }
  //     }
  //   }
  //   return responseCookies;
  // }

}