import 'package:auth_manager/core/cache/local/contract/storage_contract.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends StorageContract {
  SharedPreferencesService._();
  static final shared = SharedPreferencesService._();

  @override
  Future<void> delete<T>(String key) async {
    var instance = await SharedPreferences.getInstance();
    await instance.remove(key);
  }

  @override
  Future<T> read<T>(String key) async {
    var instance = await SharedPreferences.getInstance();
    var response = instance.getString(key);

    return response as T;
  }

  @override
  Future<void> write<T>(String key, T dataToSave) async {
    var instance = await SharedPreferences.getInstance();

    instance.setString(key, dataToSave.toString());
  }
}
