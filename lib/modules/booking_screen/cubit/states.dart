import 'package:talaky_app/data/models/all_booked.dart';

abstract class BookedStates {}

class BookedInitialState extends BookedStates {}

class BookedLoadedState extends BookedStates
{
  final List<BookedData> booked ;

  BookedLoadedState(this.booked);
}
class BookedLoadingState extends BookedStates
{
  final List<BookedData> oldBooked ;
  final bool isFirstFetch ;

  BookedLoadingState(this.oldBooked , {this.isFirstFetch = false });
}
