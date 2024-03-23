import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mfema_chat/src/models/login.dart';
import 'package:mfema_chat/src/models/user.dart';

class LoginService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final Map<String, String> _headers = {"content-type": "text/json"};
  final Map<String, String> _cookies = {};

  Future<User?> login(Login login) async {
    String loginUrl = "http://localhost:8080/api/v1/users/login";
    String currentUserUrl = "http://localhost:8080/current-user";

    http.post(Uri.parse(loginUrl), body: login.toJson()).then((response) {
      if (response.statusCode == 200) {
        _getTokenCookies(response);
        http.get(Uri.parse(currentUserUrl), headers: _headers).then((value) {
          return User.fromJson(json.decode(value.body));
        });
      }
    });
    return null;
  }

  void _getTokenCookies(http.Response response) {
    String? allCookies = response.headers['set-cookie'];
    if (allCookies != null)  {
      var setCookies = allCookies.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _storeJwtToken(cookie);
        }
      }
    }
  }

  Future<void> _storeJwtToken(String rawCookie) async {
    if (rawCookie.isNotEmpty){
      var keyValue = rawCookie.split("=");
      if (keyValue.length == 2 && keyValue[0].trim() == "token") {
        await _secureStorage.write(key: 'token', value: keyValue[1]);
        String? csrf = await _secureStorage.read(key: 'csrf');
        _cookies['token'] = keyValue[1];
        _cookies['XSRF-TOKEN'] = csrf!;
        _headers["cookies"] = _cookies.toString();
      }
    }
  }
}