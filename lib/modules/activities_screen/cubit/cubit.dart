import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/models/activities_model.dart';
import 'package:talaky_app/modules/activities_screen/cubit/states.dart';
import 'package:talaky_app/shared/network/end_points.dart';
import 'package:talaky_app/shared/network/remote/dio_helper.dart';

class ActivitiesCubit extends Cubit<ActivitiesStates> {
  ActivitiesCubit() : super(ActivitiesInitialState());
  static ActivitiesCubit get(context) => BlocProvider.of(context);


    ActivitiesModel? activitiesModel ;

  void getActivities()
  {
    emit(ActivitiesLoadingState());
    DioHelper.getData(
        url: activities ,
    ).then((value)
    {
      activitiesModel = ActivitiesModel.fromJson(value.data);
      emit(ActivitiesSuccessState(activitiesModel!));
    }).catchError((error)
    {
      emit(ActivitiesErrorState(error.toString()));

    });
  }
}