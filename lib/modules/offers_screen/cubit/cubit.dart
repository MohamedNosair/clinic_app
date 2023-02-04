import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/models/offer_model.dart';
import 'package:talaky_app/data/repositories/offer_repository.dart';
import 'package:talaky_app/modules/offers_screen/cubit/states.dart';

class OfferCubit extends Cubit<OfferStates> {
  OfferCubit(this.repository) : super(OfferInitialState());
  static OfferCubit get(context) => BlocProvider.of(context);

  int page = 1 ;

  final OfferRepository repository ;

  void loadOffer()
  {
    if(state is OfferLoadingState) return ;
    final currentState = state ;
    var oldPost = <OfferData>[] ;

    if(currentState is OfferLoadedState )
    {
      oldPost = currentState.offer;
    }
    emit(OfferLoadingState(oldPost , isFirstFetch: page == 1 ));
    repository.fetchOffer(page).then((newOffer)
    {
      page++ ;
      final offer = (state as OfferLoadingState).oldOffer ;
      offer.addAll(newOffer);

      emit(OfferLoadedState(offer));
    });
  }

}