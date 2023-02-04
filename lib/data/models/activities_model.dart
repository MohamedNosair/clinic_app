class ActivitiesModel
{
   String ? message ;
   bool ? status ;
   late List<DataModel> data ;

   ActivitiesModel.fromJson(Map<String ,dynamic > json )
   {
      message = json['message'];
      status = json['status'];
      if (json['data'] != null) {
         data = [];
         json['data'].forEach((v) {
            data.add(DataModel.fromJson(v));
         });
      }
   }
}

class DataModel
{
   late int id ;
   late String name ;
   late String image ;

   DataModel.fromJson(Map<String ,dynamic > json )
   {
      id = json['id'];
      name = json['name'];
      image = json['image'];
   }
}