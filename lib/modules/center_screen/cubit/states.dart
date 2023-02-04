
import 'package:talaky_app/data/models/center_model.dart';

abstract class CenterStates {}

class CenterInitialState extends CenterStates {}

class CenterLoadedState extends CenterStates
{
  final List<CenterData> center ;

  CenterLoadedState(this.center);
}
class CenterLoadingState extends CenterStates
{
  final List<CenterData> oldCenter ;
  final bool isFirstFetch ;

  CenterLoadingState(this.oldCenter , {this.isFirstFetch = false });
}
