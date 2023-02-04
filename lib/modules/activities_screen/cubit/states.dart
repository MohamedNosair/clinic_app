import 'package:talaky_app/data/models/activities_model.dart';

abstract class ActivitiesStates{}

class ActivitiesInitialState extends ActivitiesStates {}

class ActivitiesLoadingState extends ActivitiesStates {}

class ActivitiesSuccessState extends ActivitiesStates
{
  final ActivitiesModel model ;
  ActivitiesSuccessState(this.model);
}

class ActivitiesErrorState extends ActivitiesStates {

  ActivitiesErrorState(String error);

}
