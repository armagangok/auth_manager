import 'dart:convert';

import 'package:dio/dio.dart';

import '../../core/error/custom_error.dart';
import '../../core/error/result_types/result/result.dart';
import '../model/login_request/login_request_model.dart';
import '../model/login_response/login_response.dart';

abstract class LoginServiceContract {
  final String path = "/api/login";
  Future<Result<LoginResponse?>> requestLogin(LoginRequest request);
  final Dio dio;

  LoginServiceContract({required this.dio});
}

class LoginService extends LoginServiceContract with ServiceFailureMixin {
  LoginService({required this.dio}) : super(dio: dio);

  @override
  late final Dio dio;

  @override
  Future<Result<LoginResponse>> requestLogin(LoginRequest request) async {
    var jsonRequest = request.toJson();

    var a = jsonEncode(jsonRequest);
    print(a);
    print(a);
    print(a);
    print(a);

    

    var response = await dio.post(path, data: a);

    response.statusCode = 200;

    switch (response.statusCode) {
      case 200:
        var model = LoginResponse.fromJson(response.data);
        return Result.success(model);

      case 400:
        return Result.failure(badRequestFailure);

      case 401:
        return Result.failure(authorizedFailure);

      case 404:
        return Result.failure(notFoundFailure);

      case 500:
        return Result.failure(unexpectedFailure); // handle a server error

      default:
        return Result.failure(unknownFailure);
    }
  }
}

mixin ServiceFailureMixin {
  static const badRequestMessage =
      "Invalid request data. Please check that all required fields are included and formatted correctly.";
  final badRequestFailure = CustomFailure(message: badRequestMessage);

  static const authorizedMessage =
      "You are not authorized to access this resource. Please log in or obtain the necessary permissions.";
  final authorizedFailure = CustomFailure(message: authorizedMessage);

  static const notFoundMessage = "The requested resource could not be found.";
  final notFoundFailure = CustomFailure(message: authorizedMessage);

  static const unexpectedFailureMessage =
      "The server encountered an unexpected error. Please try again later or contact support if the problem persists.";
  final unexpectedFailure = CustomFailure(message: unexpectedFailureMessage);

  static const unknownFailureMessage =
      "An unknown error occured, please try again later."
      "The server encountered an unexpected error. Please try again later or contact support if the problem persists.";
  final unknownFailure = CustomFailure(message: unknownFailureMessage);
}
