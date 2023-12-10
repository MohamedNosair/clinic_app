import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/models/center_model.dart';
import 'package:talaky_app/data/repositories/center_repository.dart';
import 'package:talaky_app/modules/center_screen/cubit/states.dart';

class CenterCubit extends Cubit<CenterStates> {
  CenterCubit(this.repository) : super(CenterInitialState());

  static CenterCubit get(context) => BlocProvider.of(context);
  // CenterModel? centerModel ;
  //
  // void postCenter() {
  //   emit(CenterLoadingState());
  //   DioHelper.postData(
  //     url: centers,query: {
  //         'activity_id': '1' ,
  //       },
  //   ).then((value) {
  //     centerModel = CenterModel.fromJson(value.data);
  //     emit(CenterSuccessState());
  //   }).catchError((error) {
  //     emit(CenterErrorState());
  //   });
  // }
  int page = 1 ;

  final CenterRepository repository ;

  void loadCenters()
  {
    if(state is CenterLoadingState) return ;
    final currentState = state ;
    var oldPost = <CenterData>[] ;

    if(currentState is CenterLoadedState )
    {
      oldPost = currentState.center;
    }

    emit(CenterLoadingState(oldPost , isFirstFetch: page == 1 ));
    repository.fetchCenter(page).then((newCenter)

    {
      page++ ;
      final center = (state as CenterLoadingState).oldCenter ;
      center.addAll(newCenter);

      emit(CenterLoadedState(center));
    });
  }
}