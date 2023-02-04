
import 'package:talaky_app/data/models/package_model.dart';

abstract class PackageStates {}

class PackageInitialState extends PackageStates {}

class PackageLoadedState extends PackageStates
{
  final List<PackageData> package ;

  PackageLoadedState(this.package);
  }
  class PackageLoadingState extends PackageStates
{
  final List<PackageData> oldPackage ;
  final bool isFirstFetch ;

  PackageLoadingState(this.oldPackage , {this.isFirstFetch = false });
  }
