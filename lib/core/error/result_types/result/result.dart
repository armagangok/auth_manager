import 'package:freezed_annotation/freezed_annotation.dart';

import '../../custom_error.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.failure(CustomFailure failure) = Failure;
}
