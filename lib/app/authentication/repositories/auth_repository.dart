import 'package:flaury_business/app/authentication/models/register_user_model.dart';
import 'package:flaury_business/services/dio_service.dart';
import 'package:flaury_business/util/api_routes.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {
  final DioService _dioService;
  AuthRepository(this._dioService);

  Future<RegisterUserModel> signUp(String email, String password,
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

      final response = await _dioService.post(ApiRoutes.signIn, data: data);

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "Signup failed");
      }

      return RegisterUserModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
    }
  }
}
