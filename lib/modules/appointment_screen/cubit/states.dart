
import '../../../data/models/booking_model.dart';

abstract class AppointmentStates{}

class InitialAppointmentState extends AppointmentStates{}

class ChangeColorAppointmentState extends AppointmentStates{}

class ChangeColorAppointmentTimeState extends AppointmentStates{}

class ChangeAppointmentTimeState extends AppointmentStates{}


class AppointmentLoadingState extends AppointmentStates{}
class AppointmentSuccessState extends AppointmentStates{}
class AppointmentErrorState extends AppointmentStates{
  final String error ;
  AppointmentErrorState(this.error);
}



class BookingLoadingState extends AppointmentStates{}
class BookingSuccessState extends AppointmentStates{
  final BookingModel bookingModel;

  BookingSuccessState(this.bookingModel);
}
class BookingErrorState extends AppointmentStates{
  final String error ;
  BookingErrorState(this.error);
}


