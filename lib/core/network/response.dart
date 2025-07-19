import 'package:freezed_annotation/freezed_annotation.dart';
import '../error/error.dart';

part 'response.freezed.dart';

@freezed
sealed class Response<D, E extends Error> with _$Response<D, E> {
  const factory Response.success(D data) = SuccessResponse<D, E>;
  const factory Response.error(E error) = ErrorResponse<D, E>;
}

extension ResponseX<T, E extends Error> on Response<T, E> {
  Response<R, E> map<R>(R Function(T data) mapper) {
    switch(this){
      case SuccessResponse(:final data):
        return SuccessResponse(mapper(data));
      case ErrorResponse(:final error):
        return ErrorResponse(error);
    }
  }

  Response<T, E> onSuccess(void Function(T data) action) {
    if(this case SuccessResponse(:final data)){
      action(data);
    }
    return this;
  }

  Response<T, E> onError(void Function(E error) action) {
    if(this case ErrorResponse(:final error)){
      action(error);
    }
    return this;
  }
}
