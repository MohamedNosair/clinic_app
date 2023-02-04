import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/models/package_model.dart';
import 'package:talaky_app/data/repositories/package_repository.dart';
import 'package:talaky_app/modules/packages_screen/cubit/states.dart';

class PackageCubit extends Cubit<PackageStates> {
  PackageCubit(this.repository) : super(PackageInitialState());

  static PackageCubit get(context) => BlocProvider.of(context);

  int page = 1 ;

  final PackageRepository repository ;

  void loadPackages()
  {
    if(state is PackageLoadingState) return ;
    final currentState = state ;
    var oldPost = <PackageData>[] ;

    if(currentState is PackageLoadedState )
    {
      oldPost = currentState.package;
    }
    emit(PackageLoadingState(oldPost , isFirstFetch: page == 1 ));
    repository.fetchPackage(page).then((newPackage)
    {
      page++ ;
      final package = (state as PackageLoadingState).oldPackage ;
      package.addAll(newPackage);

      emit(PackageLoadedState(package));
    });
  }
}
