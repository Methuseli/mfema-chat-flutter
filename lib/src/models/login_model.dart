class LoginResponseModel {
  late String accessToken;
  late final String refreshToken;
  late final String error;

  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.error,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json["access"] ?? '',
      refreshToken: json["refresh"] ?? '',
      error: json["error"] ?? '',
    );
  }
}

class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim(),
      'password': password.trim(),
    };
    return map;
  }
}