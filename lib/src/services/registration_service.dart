import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mfema_chat/src/models/user.dart';
import 'package:mfema_chat/src/util/constants.dart';

class RegistrationService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final Map<String, String> _headers = {"content-type": "text/json"};
  final Map<String, String> _cookies = {};

  Future<User?> register(RegisterUser user) async {
    String url = "$host$apiVersion/users/signup";
    String? csrfToken = await _secureStorage.read(key: 'csrf');
    String? jwtToken = await _secureStorage.read(key: 'token');
    _cookies['token'] = jwtToken!;
    _cookies['XSRF-TOKEN'] = csrfToken!;

    _headers['cookies'] = _cookies.toString();

    final response = await http.post(Uri.parse(url), body: user.toJson(), headers: _headers);
    if (response.statusCode == 201) {
      // print(response.body)
      return User.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}