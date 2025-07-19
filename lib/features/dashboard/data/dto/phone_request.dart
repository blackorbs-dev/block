import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_request.freezed.dart';
part 'phone_request.g.dart';

@freezed
abstract class PhoneRequest with _$PhoneRequest {
  const factory PhoneRequest({
    @JsonKey(name: 'phone_number') required String number,
    @JsonKey(name: 'phone_country') required String country,
  }) = _PhoneRequest;

  factory PhoneRequest.fromJson(Map<String, dynamic> json) =>
      _$PhoneRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}
