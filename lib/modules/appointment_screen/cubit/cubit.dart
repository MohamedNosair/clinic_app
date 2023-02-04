import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/models/appointment_model.dart';
import 'package:talaky_app/modules/appointment_screen/cubit/states.dart';
import 'package:talaky_app/shared/network/end_points.dart';
import 'package:talaky_app/shared/network/remote/dio_helper.dart';

class AppointmentCubit extends Cubit<AppointmentStates> {
  AppointmentCubit() : super(InitialAppointmentState());
  static AppointmentCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;
  void changeColor(index) {
    currentIndex = index ;
    emit(ChangeColorAppointmentState());

  }
int currentIndexTime = 0 ;
  void changeColorTime(index) {
    currentIndexTime = index ;
    emit(ChangeColorAppointmentState());

  }

int currentTime = 0 ;
  void changeTime(index) {
    currentTime = index ;
    emit(ChangeAppointmentTimeState());

  }

   AppointmentModel? appointmentModel ;
 late List<String> hour = [] ;
  void getAppointment(){
    emit(AppointmentLoadingState());

    DioHelper.getData(
        url: appointment,
    ).then((value){
      appointmentModel = AppointmentModel.fromJson(value.data);
      appointmentModel!.data!.forEach((element) {
        hour.addAll(element.hour);
      });
      emit(AppointmentSuccessState());
    }).catchError((error){
      emit(AppointmentErrorState(error.toString()));
    });
  }

}
