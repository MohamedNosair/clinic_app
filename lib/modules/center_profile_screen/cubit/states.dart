abstract class CenterProfileStates {}

class CenterProfileInitialState extends CenterProfileStates {}

class CenterProfileChangeLikeBottomState extends CenterProfileStates {}


class CenterProfileLoadingState extends CenterProfileStates{}

class CenterProfileSuccessState extends CenterProfileStates{}

class CenterProfileErrorState extends CenterProfileStates{
  final String error;

  CenterProfileErrorState(this.error);
}