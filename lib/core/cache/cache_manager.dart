import 'package:auth_manager/core/cache/local/keys/local_keys.dart';
import 'package:auth_manager/core/cache/local/shared_preferences_service.dart';

import '/core/cache/local/contract/storage_contract.dart';

class CacheManager {
  CacheManager._();
  static final shared = CacheManager._();

  final StorageContract _storage = SharedPreferencesService.shared;

  Future<void> saveToken(String token) async {
    await _storage.write<String>(LocalKeys.loginToken, token);
  }

  Future<String?> fetchToken() async {
    var response = await _storage.read<String>(LocalKeys.loginToken);
    return response;
  }

  Future<void> deleteToken() async {
    await _storage.delete<String>(LocalKeys.loginToken);
  }
}
