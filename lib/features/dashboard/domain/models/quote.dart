import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote.freezed.dart';

@freezed
abstract class Quote with _$Quote {
  const factory Quote({
    required int id,
    required String text,
    required String author,
    required String category,
  }) = _Quote;

  static const empty = Quote(
    id: -1,
    text: '',
    author: '',
    category: '',
  );
}