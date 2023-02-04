import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/models/categories.dart';
import 'package:talaky_app/modules/categories_screen/cubit/states.dart';
import 'package:talaky_app/shared/network/end_points.dart';
import 'package:talaky_app/shared/network/remote/dio_helper.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitialState());

  static CategoryCubit get(context) => BlocProvider.of(context);

  CategoriesModel? categoriesModel ;

  void getCategories() {
    emit(CategoryLoadingState());
    DioHelper.getData(
      url: categories ,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(CategorySuccessState());
    }).catchError((error) {
      emit(CategoryErrorState());

    });
  }

}