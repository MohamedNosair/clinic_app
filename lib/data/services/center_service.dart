import 'dart:convert';
import 'package:http/http.dart';
import 'package:talaky_app/shared/componants/constants.dart';

class CenterService
{
  final baseUrl = 'https://beauty.softscope.net/api/app/center';
  final String uId = '1' ;
  Future<List<dynamic>> fetchCenter(int page) async{
    try{
      final response = await post(Uri.parse(baseUrl + "?page=$page") ,
          headers: {
            'Authorization': 'Bearer $token' ,
          } ,
          body: {
            'activity_id': uId
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

