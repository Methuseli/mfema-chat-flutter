import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class CsrfService {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Map<String, String> headers = {"content-type": "text/json"};
  Map<String, String> cookies = {};

  Future<dynamic> getCsrf() async {
    String url = "http://localhost:8080/csrf";

    http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        _getCSRFCookie(response);

      }
    });
    return null;
  }

  void _getCSRFCookie(http.Response response) {
    String? allCookies = response.headers['set-cookie'];
    if (allCookies != null)  {
      var setCookies = allCookies.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _storeCSRFToken(cookie);
        }
      }
    }
  }

  Future<void> _storeCSRFToken(String rawCookie) async {
    if (rawCookie.isNotEmpty){
      var keyValue = rawCookie.split("=");
      if (keyValue.length == 2 && keyValue[0].trim() == "XSRF-TOKEN") {
        await secureStorage.write(key: 'csrf', value: keyValue[1]);
      }
    }
  }
}