import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/models/city_model.dart';
import 'package:talaky_app/modules/city_screen/cubit/states.dart';
import 'package:talaky_app/shared/network/end_points.dart';
import 'package:talaky_app/shared/network/remote/dio_helper.dart';

class CityCubit extends Cubit<CityStates> {
  CityCubit() : super(CityInitialState());

  static CityCubit get(context) => BlocProvider.of(context);

  CityModel ? cityModel ;
  void getCity()
  {
    emit(CityLoadingState());
    DioHelper.getData(
      url: city,
    ).then((value){
      cityModel = CityModel.formJson(value.data);
      print(value.data);
      emit(CitySuccessState());
    }).catchError((error)
    {
      emit(CityErrorState());

    });
  }

}