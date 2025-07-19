import 'dart:async';

import 'package:block/features/dashboard/data/dto/name_request.dart';
import 'package:block/features/dashboard/data/dto/phone_request.dart';
import 'package:block/features/dashboard/data/dto/pin_request.dart';
import 'package:block/features/dashboard/data/mapper/quote_mapper.dart';
import 'package:block/features/dashboard/data/mapper/user_mapper.dart';

import '../../../../core/error/error.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/network/response.dart';
import '../../domain/models/quote.dart';
import '../../domain/models/user.dart';
import '../../domain/repository/account_repository.dart';

class AccountRepositoryImpl extends AccountRepository{
  final ApiService _apiService;
  final _controller = StreamController<User>();

  AccountRepositoryImpl(this._apiService);

  @override
  Stream<User> getUser() => _controller.stream;

  @override
  void addUser(User user) => _controller.add(user);

  @override
  Future<Response<Quote, NetworkError>> getQuote() async{
    final response = await _apiService.getQuote();
    return response.map((data) => data.toQuote());
  }

  @override
  Future<Response<void, NetworkError>> setName(String name) async{
    final response = await _apiService.setName(NameRequest(name));
    return response.onSuccess((userDto) => addUser(userDto.toUser()));
  }

  @override
  Future<Response<void, NetworkError>> setPhone(String number, String country) async{
    final response = await _apiService.setPhone(PhoneRequest(number: number, country: country));
    return response.onSuccess((userDto) => addUser(userDto.toUser()));
  }

  @override
  Future<Response<void, NetworkError>> setPin(String pin) async{
    final response = await _apiService.setPin(PinRequest(pin));
    return response.onSuccess((userDto) => addUser(userDto.toUser()));
  }

  @override
  void dispose() => _controller.close();

}