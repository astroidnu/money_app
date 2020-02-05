import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_app_v1/bloc/province_bloc/province_bloc.dart';
import 'package:money_app_v1/bloc/province_bloc/province_event.dart';
import 'package:money_app_v1/bloc/province_bloc/province_state.dart';
import 'package:money_app_v1/model/Province.dart';
import 'package:money_app_v1/res/province_item.dart';

class ProvinceListScreen extends StatefulWidget {

  @override
  _ProvinceListScreenState createState() => _ProvinceListScreenState();
}

class _ProvinceListScreenState extends State<ProvinceListScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProvinceBloc>(context).add(FetchProvince());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Province List"),),
      body: BlocBuilder<ProvinceBloc, ProvinceState>(
        builder: (context, state) {
          if(state is ProvinceLoading){
            return _buildLoadingIndicator();
          } else if (state is ProvincesLoaded) {
            return _buildProvinceListView(state.provinces);
          }
          return _buildNoResult();
        },
      )
    );
  }

  Widget _buildProvinceListView(List<Province> provinces){
    return ListView.separated(
        itemBuilder: (context, index) {
          final province = provinces[index];
          return ProvinceItem(province: province,);
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: provinces.length);
  }

  Widget _buildLoadingIndicator(){
    return Container(
      height: double.infinity,
      child: Center(child: Text("Loading"),),
    );
  }

  Widget _buildNoResult(){
    return Container(
      height: double.infinity,
      child: Center(child: Text("No Result"),),
    );
  }
}