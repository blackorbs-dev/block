import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_data.freezed.dart';
part 'quote_data.g.dart';

@freezed
abstract class QuoteData with _$QuoteData {
  const factory QuoteData({
    required QuoteDto quote,
  }) = _QuoteData;

  factory QuoteData.fromJson(Map<String, dynamic> json) =>
      _$QuoteDataFromJson(json);
}

@freezed
abstract class QuoteDto with _$QuoteDto {
  const factory QuoteDto({
    required int id,
    required String quote,
    required String author,
    required String category,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _QuoteDto;

  factory QuoteDto.fromJson(Map<String, dynamic> json) =>
      _$QuoteDtoFromJson(json);
}
