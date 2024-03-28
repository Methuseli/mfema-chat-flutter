class Login {
  final String email, password;

  Login({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };
    return map;
  }
}

class LoginResponse {
  final String? message;
  final int? statusCode;

  LoginResponse({this.message, this.statusCode});
}
