import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mfema_chat/src/models/user.dart';

class RegistrationService {
  Future<User?> register(RegisterUser user) async {
    String url = "http://localhost:8080/api/v1/users/signup";

    final response = await http.post(Uri.parse(url), body: user.toJson());
    if (response.statusCode == 201) {
      // print(response.body)
      return User.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}