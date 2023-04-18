import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_model.freezed.dart';
part 'login_request_model.g.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _UserRequestModel;

  factory LoginRequest.fromJson(Map<String, Object?> json) =>
      _$LoginRequestFromJson(json);
}
