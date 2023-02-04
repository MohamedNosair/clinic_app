import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/models/country_model.dart';
import 'package:talaky_app/modules/country_screen/cubit/states.dart';
import 'package:talaky_app/shared/network/end_points.dart';
import 'package:talaky_app/shared/network/remote/dio_helper.dart';

class CountryCubit extends Cubit<CountryStates> {
  CountryCubit() : super(CountryInitialState());

  static CountryCubit get(context) => BlocProvider.of(context);

  CountryModel? countryModel ;
  void getCountry()
  {
    emit(CountryLoadingState());
    DioHelper.getData(
      url: country,
    ).then((value){
      countryModel = CountryModel.fromJson(value.data);
      emit(CountrySuccessState());
    }).catchError((error)
    {
      emit(CountryErrorState());

    });
  }

}