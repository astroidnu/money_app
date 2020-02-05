import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_app_v1/bloc/province_bloc/province_event.dart';
import 'package:money_app_v1/bloc/province_bloc/province_state.dart';
import 'package:money_app_v1/data_layer/repository.dart';
import 'package:money_app_v1/model/Province.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {

  final Repository repository;

  ProvinceBloc({@required this.repository});

  @override
  ProvinceState get initialState => ProvinceLoading();

  @override
  Stream<ProvinceState> mapEventToState(ProvinceEvent event) async* {
    if (event is FetchProvince) {
      yield* _fetchProvinces();
    }
  }

  Stream<ProvinceState> _fetchProvinces() async* {
    try {
      final response = await this.repository.getProvinces();
      yield ProvincesLoaded(provinces: response.provinces);
    } catch (error) {
      yield ProvinceError(errorMessage: error);
    }
  }


}