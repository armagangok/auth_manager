import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '/core/extension/context_extension.dart';

import '/core/cache/cache_manager.dart';
import '/core/network/constant/constants.dart';
import '/home/home.dart';
import 'login.dart';
import 'model/login_request/login_request_model.dart';
import 'service/login_service.dart';

abstract class LoginViewModel extends State<Login>  {
  late final LoginServiceContract _loginService;

  @override
  void initState() {
    final dio = Dio(
      BaseOptions(baseUrl: KNetwork.baseUrl),
    );
    dio.interceptors.add(PrettyDioLogger());
    _loginService = LoginService(dio: dio);

    super.initState();
  }

  Future requestLogin(LoginRequest request) async {
    var response = await _loginService.requestLogin(request);

    response.when(
      success: (data) async {
        if (data != null) {
          await CacheManager.shared. saveToken(data.token ?? "");

          context.navigateAndPop(const Home());
        }
      },
      failure: (failure) {
        print(failure);
      },
    );
  }
}

