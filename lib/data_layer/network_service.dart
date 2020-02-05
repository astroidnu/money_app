import 'package:dio/dio.dart';
import 'dart:convert' show json;
import 'package:money_app_v1/model/Province.dart';

abstract class NetworkServiceProvider {

  Future<BaseResponse> getProvinces();

}

class AppNetworkServiceProvider implements NetworkServiceProvider {
  final String _baseUrl = "http://dev.farizdotid.com/api/daerahindonesia/";

  Dio _dio;

  AppNetworkServiceProvider(){
    final BaseOptions options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = Dio(options);
  }

  @override
  Future<BaseResponse> getProvinces() async {
    Response response = await _dio.get("$_baseUrl/provinsi");
    return BaseResponse.fromJson(json.decode(response.data));
  }


}