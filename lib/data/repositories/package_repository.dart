import 'package:talaky_app/data/models/package_model.dart';
import 'package:talaky_app/data/services/package_service.dart';

class PackageRepository
{
  final PackageService service ;

  PackageRepository(this.service);

  Future<List<PackageData>> fetchPackage (int page) async {

    final package = await service.fetchPackage(page) ;

    return package.map((e) => PackageData.fromJson(e)).toList() ;
  }
}