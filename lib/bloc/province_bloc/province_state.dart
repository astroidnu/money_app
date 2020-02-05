import 'package:equatable/equatable.dart';
import 'package:money_app_v1/model/Province.dart';

abstract class ProvinceState extends Equatable {
  const ProvinceState();

  @override
  List<Object> get props => [];
}

class ProvincesLoaded extends ProvinceState {
  final List<Province> provinces;

  ProvincesLoaded({this.provinces});

  @override
  List<Object> get props => [provinces];
}

class ProvinceLoading extends ProvinceState {}

class ProvinceError extends ProvinceState {
  final String errorMessage;
  ProvinceError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}