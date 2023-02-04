import 'package:talaky_app/data/models/center_model.dart';
import 'package:talaky_app/data/services/center_service.dart';

class CenterRepository
{
  final CenterService service ;

  CenterRepository(this.service);

  Future<List<CenterData>> fetchCenter (int page) async {

    final center = await service.fetchCenter(page) ;

    return center.map((e) => CenterData.fromJson(e)).toList() ;
  }
}