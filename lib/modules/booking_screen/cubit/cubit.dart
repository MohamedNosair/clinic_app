import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/repositories/all_booked_repository.dart';
import 'package:talaky_app/modules/booking_screen/cubit/states.dart';
import '../../../data/models/all_booked.dart';

class BookedCubit extends Cubit<BookedStates> {
  BookedCubit(this.repository) : super(BookedInitialState());

  static BookedCubit get(context) => BlocProvider.of(context);

  int page = 1 ;

  final BookedRepository repository ;

  void loadBookeds()
  {
    if(state is BookedLoadingState) return ;
    final currentState = state ;
    var oldPost = <BookedData>[] ;

    if(currentState is BookedLoadedState )
    {
      oldPost = currentState.booked;
    }

    emit(BookedLoadingState(oldPost , isFirstFetch: page == 1 ));
    repository.fetchBooked(page).then((newBooked)

    {
      page++ ;
      final center = (state as BookedLoadingState).oldBooked ;
      center.addAll(newBooked);

      emit(BookedLoadedState(center));
    });
  }
}