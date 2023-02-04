import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/models/package_details_model.dart';
import 'package:talaky_app/modules/package_details_screen/cubit/states.dart';
import 'package:talaky_app/shared/network/end_points.dart';
import 'package:talaky_app/shared/network/remote/dio_helper.dart';

class PackageDetailsCubit extends Cubit<PackageDetailsStates>{
  PackageDetailsCubit() : super(PackageDetailsInitialState());

  static PackageDetailsCubit get(context) => BlocProvider.of(context);

  PackageDetailsModel?packageDetailsModel ;

  void getPackageDetails({required int id}) {
    emit(PackageDetailsLoadingState());
    print("package details loading state ");
    DioHelper.getData(
      url: packageDetails + "$id",
    ).then((value) {
      packageDetailsModel = PackageDetailsModel.fromJson(value.data);
      print("PackageDetailsSuccessState ");
      emit(PackageDetailsSuccessState());
    }).catchError((error) {
      emit(PackageDetailsErrorState());
    });
  }

}





























