
import 'package:talaky_app/data/models/login.dart';

abstract class LoginStates{}

class InitialLoginState extends LoginStates{}

class ChangePasswordState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates
{
  final UserModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates
{
  final String error ;
  // final UserModel loginModel;
  LoginErrorState(this.error,);



}

