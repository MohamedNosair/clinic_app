import 'dart:convert';
import 'package:http/http.dart';
import 'package:talaky_app/shared/componants/constants.dart';

class OfferService
{
  final baseUrl = 'https://beauty.softscope.net/api/app/offer';

  Future<List<dynamic>> fetchOffer(int page) async{
    try{
      final response = await post(Uri.parse(baseUrl + "?page=$page") ,
          headers: {
            'Authorization': 'Bearer $token' ,
          } , body: {
            'city_id': '1',
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

