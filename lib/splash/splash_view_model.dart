import '../core/auth_manager.dart';
import '../core/extension/context_extension.dart';
import '../home/home.dart';
import '../home/models/user_model.dart';
import '../login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'splash.dart';

abstract class SplashViewModel extends State<Splash> {
  @override
  void initState() {
    _checkAuthStatus();

    super.initState();
  }

  Future<void> _checkAuthStatus() async {
    await _authManager.checkTokenStatus();

    if (_authManager.isLoggedIn) {
      Future.delayed(const Duration(seconds: 3));
      _authManager.userModel = UserModel(
        name: "Armağan Gök",
        imageUrl: "https://avatars.githubusercontent.com/u/70090723?v=4",
      );

      context.navigateAndPop(const Home());
    } else {
      context.navigateAndPop(const Login());
    }
  }

  AuthManager get _authManager => context.read<AuthManager>();
}
