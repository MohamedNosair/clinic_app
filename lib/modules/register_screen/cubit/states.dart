
import 'package:talaky_app/data/models/login.dart';

abstract class RegisterStates{}

class InitialRegisterState extends RegisterStates{}

class ChangePasswordState extends RegisterStates{}


class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates {

  final UserModel registerModel;

  RegisterSuccessState(this.registerModel);

}

class RegisterErrorState extends RegisterStates {
  final String error ;

  RegisterErrorState(this.error);
}
