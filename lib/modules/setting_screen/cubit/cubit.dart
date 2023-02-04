import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/modules/setting_screen/cubit/state.dart';

class SettingCubit extends Cubit<SettingStates> {
  SettingCubit() : super(InitialSettingState());

  static SettingCubit get(context) => BlocProvider.of(context);


}
