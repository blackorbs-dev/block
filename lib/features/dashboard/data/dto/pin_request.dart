import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_request.freezed.dart';
part 'pin_request.g.dart';

@freezed
abstract class PinRequest with _$PinRequest {
  const factory PinRequest(
    @JsonKey(name: 'pin') String data,
  ) = _PinRequest;

  factory PinRequest.fromJson(Map<String, dynamic> json) => _$PinRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}
