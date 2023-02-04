import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/models/offer_details.dart';
import 'package:talaky_app/modules/name_offer_screen/cubit/states.dart';
import 'package:talaky_app/shared/network/end_points.dart';
import 'package:talaky_app/shared/network/remote/dio_helper.dart';

class OfferDetailsCubit extends Cubit<OfferDetailsStates>{
  OfferDetailsCubit() : super(OfferDetailsInitialState());

  static OfferDetailsCubit get(context) => BlocProvider.of(context);

  OfferDetailsModel? offerDetailsModel ;

  void getOfferDetails({required int id}) {
    emit(OfferDetailsLoadingState());
    print("offer details loading state ");
    DioHelper.getData(
      url: offerDetails +"$id",
    ).then((value) {
      offerDetailsModel = OfferDetailsModel.fromJson(value.data);
      print("OfferDetailsSuccessState ");
      emit(OfferDetailsSuccessState());
    }).catchError((error) {
      emit(OfferDetailsErrorState());
    });
  }

}





























