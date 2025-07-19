import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';

abstract class Error{}

@freezed
sealed class NetworkError with _$NetworkError implements Error {
  const factory NetworkError.requestTimeout() = RequestTimeout;
  const factory NetworkError.tooManyRequests() = TooManyRequests;
  const factory NetworkError.noInternet() = NoInternet;
  const factory NetworkError.server() = ServerError;
  const factory NetworkError.serialization() = SerializationError;
  const factory NetworkError.unknown() = UnknownError;
  const factory NetworkError.message(String message) = ErrorMessage;
}