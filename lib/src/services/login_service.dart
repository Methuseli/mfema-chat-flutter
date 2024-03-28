import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mfema_chat/src/models/login.dart';
import 'package:mfema_chat/src/services/csrf_service.dart';
import 'package:mfema_chat/src/util/constants.dart';
import 'package:mfema_chat/src/util/cookie_manager.dart';

class LoginService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final Map<String, String> _headers = {"Content-Type": "application/json"};
  List<Cookie> _cookies = [];

  Future<http.Response?> login(Login login) async {
    String loginUrl = "$host$apiVersion/users/login";
    String currentUserUrl = "$host/current-user";

    _cookies =
        await CookieManager.getRequestCookies(Uri.parse(CsrfService.url));
    _headers['Cookie'] =
        _cookies.map((cookie) => '${cookie.name}=${cookie.value}').join(';');

    final response = await http.post(Uri.parse(loginUrl),
        body: jsonEncode(login.toJson()), headers: _headers);
    if (response.statusCode == 200) {
      _getTokenCookies(response);
      final jwtToken =
          Cookie.fromSetCookieValue(response.headers['set-cookie']!);
      _cookies.add(jwtToken);
      _headers['Cookie'] =
          _cookies.map((cookie) => '${cookie.name}=${cookie.value}').join(';');
      final value = await http.get(Uri.parse(currentUserUrl), headers: _headers);
      return value;
    } else {
      return response;
    }
  }

  void _getTokenCookies(http.Response response) {
    String? allCookies = response.headers['set-cookie'];
    var setCookies = allCookies!.split(',');

    for (var setCookie in setCookies) {
      var cookies = setCookie.split(';');

      for (var cookie in cookies) {
        _storeJwtToken(cookie);
      }
    }
  }

  Future<void> _storeJwtToken(String rawCookie) async {
    if (rawCookie.isNotEmpty) {
      var keyValue = rawCookie.split("=");
      if (keyValue.length == 2 && keyValue[0].trim() == "token") {
        await _secureStorage.write(key: 'token', value: keyValue[1]);
      }
    }
  }
}
