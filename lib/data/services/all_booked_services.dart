import 'dart:convert';
import 'package:http/http.dart';
import 'package:talaky_app/shared/componants/constants.dart';

class BookedService
{
  final baseUrl = 'https://beauty.softscope.net/api/app/booking';
  final String uId = '1' ;
  Future<List<dynamic>> fetchBooked(int page) async{
    try{
      final response = await get(Uri.parse(baseUrl + "?page=$page") ,
          headers: {
            'Authorization': 'Bearer $token' ,
          } ,

      );
      var jsonRes = jsonDecode(response.body);

      var listToReturn = jsonRes['data']['data'];

      return listToReturn ;

    }catch(error){
      return [] ;
    }
  }
}

