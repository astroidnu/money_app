class Province {
  final String id;
  final String name;

  Province({this.id, this.name});

  Province.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['nama'];

}

class BaseResponse {
  bool error;
  String message;
  List<Province> provinces;

  BaseResponse({this.error, this.message, this.provinces});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    provinces = (json['semuaprovinsi']).map<Province>((provinceJson) {
      return Province.fromJson(provinceJson);
    }).toList();

  }
}