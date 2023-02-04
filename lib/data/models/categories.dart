class CategoriesModel {
  String? message;
  bool? status;
  late List<Data> data;

  CategoriesModel(
      {required this.message, required this.status, required this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null)
    {
      data = [];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
        // print(data);
      });
    }
  }


}

class Data {
  late int id;
  late String nameEn;
  late String name;
  late String image;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    name = json['name'];
    image = json['image'];
  }


}
