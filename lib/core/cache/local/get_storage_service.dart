// import 'package:get_storage/get_storage.dart';

// import 'contract/storage_contract.dart';

// class GetStorageImp implements StorageContract {
//   GetStorageImp._();

//   static final shared = GetStorageImp._();
//   final GetStorage _storage = GetStorage();

//   @override
//   Future<T> read<T>(String key) async {
//     var response = await _storage.read(key);
//     return response;
//   }

//   @override
//   Future<void> delete<T>(String key) async {
//     await _storage.remove(key);
//   }

//   @override
//   Future<void> write<T>(String key, T dataToSave) async {
//     await _storage.write(key, dataToSave);
//   }
// }
