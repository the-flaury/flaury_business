class RegisterUserModel {
  final String accessToken;
  final String refreshToken;
  final String userId;
  final String message;
  final String status;

  RegisterUserModel({
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.message,
    required this.status,
  });

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return RegisterUserModel(
      accessToken: json['response data']['access_token'],
      refreshToken: json['response data']['refresh_token'],
      userId: json['response data']['user_id'],
      message: json['response description'],
      status: json['response status'],
    );
  }
}
