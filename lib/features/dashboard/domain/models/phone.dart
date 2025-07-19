import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone.freezed.dart';

@freezed
abstract class Phone with _$Phone{
  const factory Phone({
    required String country,
    required String number,
  }) = _Phone;

  static const empty = Phone(
    country: '',
    number: '',
  );
}