import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/models/login.dart';
import 'package:talaky_app/modules/login_screen/cubit/states.dart';
import 'package:talaky_app/shared/network/end_points.dart';
import 'package:talaky_app/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_off;

  bool isPassword = true ;

  void changePassword() {

    isPassword =! isPassword ;

    suffix = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(ChangePasswordState());
  }

  late UserModel loginModel ;

  void userLogin({
  required String email ,
  required String password ,
}) {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: login,
        data:
        {
          'email': email ,
          'password': password ,
        },
    ).then((value)
    {
      loginModel = UserModel.formJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {

      emit(LoginErrorState(error.toString() ));
    });
  }



}
