import 'package:flaury_business/app/authentication/models/login_response_model.dart';
import 'package:flaury_business/app/authentication/models/register_user_model.dart';
import 'package:flaury_business/app/authentication/models/user_model.dart';
import 'package:flaury_business/services/dio_service.dart';
import 'package:flaury_business/util/api_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authrepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(ref.read(dioServiceProvider)));

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
  Future<ApiResponseModel> forgotPassword(String email) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
      };

      final response =
          await _dioService.post(ApiRoutes.forgotPassword, data: data);

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "Forgot password failed");
      }

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
    }
  }

  @override
  Future<LoginResponse> login(String email, String password) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "password": password,
      };

      final response = await _dioService.post(ApiRoutes.login, data: data);

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "Forgot password failed");
      }

      return LoginResponse.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
    }
  }

  @override
  Future<ApiResponseModel> logout() async {
    try {
      final response = await _dioService.post(
        ApiRoutes.logout,
      );

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "logout failed");
      }

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
    }
  }

  @override
  Future<ApiResponseModel> refreshAccessToken() async {
    // you have to pass the refresh token in the header
    // and the refresh token is stored in the local storage
    try {
      final response = await _dioService.post(
        ApiRoutes.refreshAccessToken,
      );

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "refresh token failed");
      }

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
    }
  }

  @override
  Future<ApiResponseModel> resendVerifcationCode(String email) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
      };
      final response = await _dioService.post(
        ApiRoutes.resendVerifcationCode,
        data: data,
      );

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "refresh token failed");
      }

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
    }
  }

  @override
  Future<ApiResponseModel> resetPassword(
      String email, String newPassword, String verificationCode) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "new_password": newPassword,
        "verification_code": verificationCode,
      };
      final response = await _dioService.post(
        ApiRoutes.resetPassword,
        data: data,
      );

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "reset password  failed");
      }

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
    }
  }

  @override
  Future<ApiResponseModel> verifyEmail(String email, String code) async {
    // TODO: implement verifyEmail
    try {
      Map<String, dynamic> data = {
        "email": email,
        "code": code,
      };
      final response = await _dioService.post(
        ApiRoutes.verifyEmail,
        data: data,
      );

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "verify email failed");
      }

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
    }
  }

  @override
  Future<UserModel> verifyUserIsAuthenticated() async {
    try {
      final response = await _dioService.post(
        ApiRoutes.verifyUserAuth,
      );

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "verify user auth failed");
      }

      return UserModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
    }
  }
}

abstract class AuthRepository {
  Future<RegisterResponse> signUp(String email, String password,
      String firstName, String lastName, String userName);
  Future<ApiResponseModel> logout();
  Future<LoginResponse> login(String email, String password);

  Future<ApiResponseModel> refreshAccessToken();
  Future<ApiResponseModel> forgotPassword(String email);
  Future<ApiResponseModel> resendVerifcationCode(String email);
  Future<ApiResponseModel> resetPassword(
      String email, String newPassword, String verificationCode);
  Future<ApiResponseModel> verifyEmail(String email, String code);
  Future<UserModel> verifyUserIsAuthenticated();
}
