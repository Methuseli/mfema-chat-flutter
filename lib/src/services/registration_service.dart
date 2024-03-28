import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mfema_chat/src/models/user.dart';
import 'package:mfema_chat/src/services/csrf_service.dart';
import 'package:mfema_chat/src/util/constants.dart';
import 'package:mfema_chat/src/util/cookie_manager.dart';

class RegistrationService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final Map<String, String> _headers = {"content-type": "text/json"};
  List<Cookie> _cookies = [];

  Future<http.Response?> register(RegisterUser user) async {
    String url = "$host$apiVersion/users/signup";

    _cookies = await CookieManager.getRequestCookies(Uri.parse(CsrfService.url));
    _headers['Cookie'] = _cookies.map((cookie) => '${cookie.name}=${cookie.value}').join(';');


    final response = await http.post(Uri.parse(url), body: user.toJson(), headers: _headers);
    return response;
  }
}