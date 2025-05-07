import 'package:flaury_business/app/authentication/models/login_response_model.dart';
import 'package:flaury_business/app/authentication/models/register_user_model.dart';
import 'package:flaury_business/app/authentication/models/user_model.dart';
import 'package:flaury_business/services/dio_service.dart';
import 'package:flaury_business/util/api_routes.dart';
import 'package:flutter/foundation.dart';

class AuthRepositoryImpl implements AuthRepository {
  final DioService _dioService;
  AuthRepositoryImpl(this._dioService);

  @override
  Future<RegisterResponse> signUp(String email, String password,
      String firstName, String lastName, String userName) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
        "role": "service provider",
        "type_of_service": "basic",
        "username": userName,
      };

      final response = await _dioService.post(ApiRoutes.signUp, data: data);

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "Signup failed");
      }

      return RegisterResponse.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
    }
  }

  @override
  Future<ApiResponseModel> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<ApiResponseModel> refreshAccessToken() {
    // TODO: implement refreshAccessToken
    throw UnimplementedError();
  }

  @override
  Future<ApiResponseModel> resendVerifcationCode() {
    // TODO: implement resendVerifcationCode
    throw UnimplementedError();
  }

  @override
  Future<ApiResponseModel> resetPassword(
      String email, String newPassword, String verificationCode) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<ApiResponseModel> verifyEmail(String email, String code) {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }

  @override
  Future<UserModel> verifyUserIsAuthenticated() {
    // TODO: implement verifyUserIsAuthenticated
    throw UnimplementedError();
  }
}

abstract class AuthRepository {
  Future<RegisterResponse> signUp(String email, String password,
      String firstName, String lastName, String userName);
  Future<void> logout();
  Future<LoginResponse> login(String email, String password);

  Future<ApiResponseModel> refreshAccessToken();
  Future<ApiResponseModel> forgotPassword(String email);
  Future<ApiResponseModel> resendVerifcationCode();
  Future<ApiResponseModel> resetPassword(
      String email, String newPassword, String verificationCode);
  Future<ApiResponseModel> verifyEmail(String email, String code);
  Future<UserModel> verifyUserIsAuthenticated();
}
