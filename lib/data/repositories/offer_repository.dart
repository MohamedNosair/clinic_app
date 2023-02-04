import 'package:talaky_app/data/models/offer_model.dart';
import 'package:talaky_app/data/services/offer_service.dart';

class OfferRepository
{
  final OfferService service ;

  OfferRepository(this.service);

  Future<List<OfferData>> fetchOffer (int page) async {

    final package = await service.fetchOffer(page) ;

    return package.map((e) => OfferData.fromJson(e)).toList() ;
  }
}