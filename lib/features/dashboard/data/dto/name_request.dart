import 'package:freezed_annotation/freezed_annotation.dart';

part 'name_request.freezed.dart';
part 'name_request.g.dart';

@freezed
abstract class NameRequest with _$NameRequest {
  const factory NameRequest(
    @JsonKey(name: 'name') String data,
  ) = _NameRequest;

  factory NameRequest.fromJson(Map<String, dynamic> json) =>
      _$NameRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}
