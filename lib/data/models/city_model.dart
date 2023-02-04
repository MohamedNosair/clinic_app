class CityModel {
  String ? message ;
  bool  ? status ;
  late List<DataCity>  data ;
  CityModel.formJson(Map<String ,dynamic > json)
  {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null )
    {
      data =<DataCity>[] ;
      json['data'].forEach((element)
      {
        data.add(DataCity.formJson(element));
      });
    }
  }
}

class DataCity{
  int ? id ;
  String ? name ;

  DataCity.formJson(Map<String ,dynamic > json)
  {
    id = json['id'];
    name = json['name'];
  }
}