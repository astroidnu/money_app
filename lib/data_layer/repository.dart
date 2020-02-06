import 'package:money_app_v1/data_layer/network_service.dart';
import 'package:money_app_v1/model/province.dart';

class Repository {
  NetworkServiceProvider _networkServiceProvider;

  Repository(this._networkServiceProvider);

  Future<BaseResponse> getProvinces(){
    return _networkServiceProvider.getProvinces();
  }
}