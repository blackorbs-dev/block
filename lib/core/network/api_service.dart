import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Response;

import '../../features/dashboard/data/dto/user_dto.dart';
import '../../features/auth/data/dto/auth_data.dart';
import '../../features/auth/data/dto/auth_request.dart';
import '../../features/dashboard/data/dto/name_request.dart';
import '../../features/dashboard/data/dto/phone_request.dart';
import '../../features/dashboard/data/dto/pin_request.dart';
import '../../features/dashboard/data/dto/quote_data.dart';
import '../error/error.dart';
import 'response.dart';
import 'call_adapter.dart';
import 'endpoints.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Api.baseUrl, callAdapter: ResponseAdapter)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(Api.login)
  Future<Response<AuthData, NetworkError>> login(@Body() AuthRequest request);

  @POST(Api.register)
  Future<Response<AuthData, NetworkError>> register(@Body() AuthRequest request);

  @POST(Api.setPin)
  Future<Response<UserDto, NetworkError>> setPin(@Body() PinRequest request);

  @POST(Api.setName)
  Future<Response<UserDto, NetworkError>> setName(@Body() NameRequest request);

  @POST(Api.setPhone)
  Future<Response<UserDto, NetworkError>> setPhone(@Body() PhoneRequest request);

  @GET(Api.dashboard)
  Future<Response<QuoteData, NetworkError>> getQuote();
}
