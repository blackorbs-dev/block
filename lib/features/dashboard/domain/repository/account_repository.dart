import '../../../../core/error/error.dart';
import '../../../../core/network/response.dart';
import '../models/quote.dart';
import '../models/user.dart';

abstract class AccountRepository{
  Stream<User> getUser();
  void addUser(User user);
  void dispose();
  Future<Response<Quote, NetworkError>> getQuote();
  Future<Response<void, NetworkError>> setPin(String pin);
  Future<Response<void, NetworkError>> setName(String name);
  Future<Response<void, NetworkError>> setPhone(String number, String country);
}