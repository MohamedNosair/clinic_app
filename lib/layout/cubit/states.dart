import 'package:talaky_app/data/models/categories.dart';

import '../../data/models/center_model.dart';
import '../../data/models/offer_model.dart';
import '../../data/models/package_model.dart';

abstract class HomeLayOutStates {}

class InitialHomeState extends HomeLayOutStates{}

class ChangeBottomNavBarHomeState extends HomeLayOutStates{}

///CATEGORY STATES
class CategoriesLoadingState extends HomeLayOutStates{}

class CategoriesSuccessState extends HomeLayOutStates{
  final CategoriesModel categoriesModel ;

  CategoriesSuccessState(this.categoriesModel);
}

class CategoriesErrorState extends HomeLayOutStates{}

///CENTER STATES

class CentersLoadingState extends HomeLayOutStates{}

class CentersSuccessState extends HomeLayOutStates{
  final CenterModel centerModel ;

  CentersSuccessState(this.centerModel);
}

class CentersErrorState extends HomeLayOutStates{}

///PACKAGE STATES

class PackagesLoadingState extends HomeLayOutStates{}

class PackagesSuccessState extends HomeLayOutStates{
  final PackageModel packageModel ;

  PackagesSuccessState(this.packageModel);
}

class PackagesErrorState extends HomeLayOutStates{}

///OFFER STATES

class OffersLoadingState extends HomeLayOutStates{}

class OffersSuccessState extends HomeLayOutStates{
   OfferModel offerModel ;

  OffersSuccessState(this.offerModel);
}

class OffersErrorState extends HomeLayOutStates{}