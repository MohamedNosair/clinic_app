import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/models/login.dart';
import 'package:talaky_app/modules/register_screen/cubit/states.dart';
import 'package:talaky_app/shared/network/end_points.dart';
import 'package:talaky_app/shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_off;

  bool isPassword = true;

  void changePassword() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(ChangePasswordState());
  }

  UserModel ? registerModel ;

  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    emit(RegisterLoadingState());
    print("cubit loading state  $registerModel");
    DioHelper.postData(
      url: register ,
      data: {
        'email': email,
        'password': password,
        'phone': phone,
        'name': name,
      },
    ).then((value)
    {
      registerModel = UserModel.formJson(value.data);
      emit(RegisterSuccessState(registerModel!));
    }).catchError((error){
      emit(RegisterErrorState(error.toString()));
    });
  }

}
