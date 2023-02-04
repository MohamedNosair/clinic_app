import 'dart:convert';
import 'package:http/http.dart';
import 'package:talaky_app/shared/componants/constants.dart';

class PackageService
{
  final baseUrl = 'https://beauty.softscope.net/api/app/package';

  Future<List<dynamic>> fetchPackage(int page) async{
    try{
      final response = await post(Uri.parse(baseUrl + "?page=$page") ,
          headers: {
            'Authorization': 'Bearer $token' ,
          } , body: {
        'activity_id': '1'
          }
      );
      var jsonRes = jsonDecode(response.body);

      var listToReturn = jsonRes['data']['data'];

      return listToReturn ;

    }catch(error){
      return [] ;
    }
  }
}

