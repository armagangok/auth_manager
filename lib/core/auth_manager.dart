import 'cache/cache_manager.dart';
import '../home/models/user_model.dart';
import 'package:flutter/material.dart';

class AuthManager {
  final _cacheManager = CacheManager.shared;
  BuildContext context;
  AuthManager({
    required this.context,
  });

  bool isLoggedIn = false;

  UserModel? userModel;

  // @override
  // Future<void> deleteToken() {}

  @override
  Future<void> checkTokenStatus() async {
    var response = await _cacheManager.fetchToken();
    if (response != null) {
      isLoggedIn = true;
    }
  }

  // @override
  // Future<void> saveToken(String token) {}
}
