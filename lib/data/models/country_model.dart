class CountryModel {
  String ? message ;
  bool ? status ;
 late  List<DataCountry>  data ;

  CountryModel.fromJson( Map <String , dynamic> json )
  {
    message = json['message'];
    status = json['status'];
    if(json['data'] != null )
    {
      data = <DataCountry>[] ;
      json['data'].forEach((element)
      {
        data.add(DataCountry.fromJson(element));
      });
    }
  }
 }
class DataCountry {
  int ? id ;
  String ? name ;

  DataCountry.fromJson( Map <String , dynamic> json )
  {
    id = json['id'];
    name = json['name'];
  }
}


