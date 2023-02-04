
import 'package:talaky_app/data/models/offer_model.dart';

abstract class OfferStates {}

class OfferInitialState extends OfferStates {}

class OfferLoadedState extends OfferStates
{
  final List<OfferData> offer ;

  OfferLoadedState(this.offer);


}
class OfferLoadingState extends OfferStates
{
  final List<OfferData> oldOffer ;
  final bool isFirstFetch ;

  OfferLoadingState(this.oldOffer , {this.isFirstFetch = false });
}
