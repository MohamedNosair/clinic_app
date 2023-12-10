import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:talaky_app/data/models/categories.dart';
import 'package:talaky_app/data/models/center_model.dart';
import 'package:talaky_app/data/models/offer_model.dart';
import 'package:talaky_app/data/models/package_model.dart';
import 'package:talaky_app/layout/cubit/states.dart';
import 'package:talaky_app/modules/booking_screen/booking_screen.dart';
import 'package:talaky_app/modules/home_screen/presentation/home_screen.dart';
import 'package:talaky_app/modules/setting_screen/setting_screen.dart';
import 'package:talaky_app/shared/network/end_points.dart';
import 'package:talaky_app/shared/network/remote/dio_helper.dart';
import 'package:talaky_app/shared/ui/resources/app_strings.dart';

class HomeLayOutCubit extends Cubit<HomeLayOutStates> {
  HomeLayOutCubit() : super(InitialHomeState());

  static HomeLayOutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        IconlyBroken.home,
      ),
      label: 'home',
    ),
    const BottomNavigationBarItem(
        icon: Icon(IconlyBroken.bookmark), label: 'bookings'),
    const BottomNavigationBarItem(
        icon: Icon(
          IconlyBroken.setting,
        ),
        label: 'settings',
    ),
  ];

  List<Widget> screens = [
    HomeScreen(),
    BookingScreen(),
    SettingScreen(),
  ];

  List titles = [
    AppText(text:'home'),
    AppText(text:'bookings'),
    AppText(text:'settings'),

  ];

  void changeBottom(int index) {
    currentIndex = index;

    emit(ChangeBottomNavBarHomeState());
  }


  CategoriesModel? categoriesModel ;
  void getCategories() {
    emit(CategoriesLoadingState());
    DioHelper.getData(
      url: categories,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print('###categoriesModel  ${categoriesModel!.data[0].name}');
      emit(CategoriesSuccessState(categoriesModel!));
    }).catchError((error) {
      emit(CategoriesErrorState());
    });
  }

  CenterModel? centerModel ;
  void postCenters() {
    emit(CentersLoadingState());

    DioHelper.postData(
      url: centers,
      query:
      {
        'activity_id': 1 ,
      }
    ).then((value) {
      centerModel = CenterModel.fromJson(value.data);
      print('###centerModel  ${centerModel!.data!.data![0].name}');
      emit(CentersSuccessState(centerModel!));
    }).catchError((error) {
      emit(CentersErrorState());
    });
  }
  PackageModel? packageModel ;
  void postPackage() {
    emit(PackagesLoadingState());

    DioHelper.postData(url: package, query: {
      'activity_id': '1',
      'city_id': 1,
    }).then((value) {
      packageModel = PackageModel.fromJson(value.data);
      print('###packageModel  ${packageModel!.data!.data![0].name}');
      emit(PackagesSuccessState(packageModel!));
    }).catchError((error) {
      emit(PackagesErrorState());
    });
  }
  OfferModel ? offerModel ;
  void postOffer() {
    emit(OffersLoadingState());
    DioHelper.postData(
        url: offer,
        query: {
      'activity_id': '1',
          'city_id': 1,
    }).then((value) {
      offerModel = OfferModel.fromJson(value.data);
      print('###offerModel  ${offerModel!.data!.data![0].name}');
      emit(OffersSuccessState(offerModel!));
    }).catchError((error) {
      emit(OffersErrorState());

    });
  }
}
