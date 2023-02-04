import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/models/center_details.dart';
import 'package:talaky_app/modules/center_profile_screen/cubit/states.dart';
import 'package:talaky_app/shared/network/end_points.dart';
import 'package:talaky_app/shared/network/remote/dio_helper.dart';

class CenterProfileCubit extends Cubit<CenterProfileStates> {
  CenterProfileCubit() : super(CenterProfileInitialState());

  static CenterProfileCubit get(context) => BlocProvider.of(context);

  // bool like = false;
  //
  // void onLike() {
  //   like = !like;
  //   emit(CenterProfileChangeLikeBottomState());
  // }
  // void onClick() {
  //   like = !like;
  //   emit(CenterProfileChangeLikeBottomState());
  // }

  CenterDetailsModel? centerDetailsModel;
  void getCenterProfile({required int id}) {
    emit(CenterProfileLoadingState());
    DioHelper.getData(
      url: centerDetails + "$id",
    ).then((value) {
      centerDetailsModel = CenterDetailsModel.fromJson(value.data);
      emit(CenterProfileSuccessState());
    }).catchError((error) {
      emit(CenterProfileErrorState(error.toString()));
    });
  }

//  String text ;
// late String firstHalf ;
// late String secondHalf ;
// bool hiddenText = true ;
// double textHeight = 20 ;
}

//
// class ExpandableTextWidget extends StatefulWidget {
//   final String text;
//
//   const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);
//
//   @override
//   State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
// }
//
// class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
//   late String firstHalf;
//
//   late String secondHalf;
//
//   bool hiddenText = true;
//
//   double textHeight = Dimensions.expandableHeightText;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.text.length > textHeight) {
//       firstHalf = widget.text.substring(0, textHeight.toInt());
//       secondHalf =
//           widget.text.substring(textHeight.toInt() + 1, widget.text.length);
//     } else {
//       firstHalf = widget.text;
//       secondHalf = "";
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: secondHalf.isEmpty ? SmallText(text: firstHalf) : Column(
//         children: [
//           SmallText(height: 1.8,color :AppColors.paraColor , text: hiddenText ? (firstHalf + "...") : (firstHalf + secondHalf) ),
//           InkWell(
//             onTap: ()
//             {
//               setState(() {
//                 hiddenText =! hiddenText ;
//               });
//             },
//             child: Row(
//               children: [
//                 hiddenText ? SmallText(text: "Show More" ,color: AppColors.mainColor,) : SmallText(text: "Show Less" ,color: AppColors.mainColor,) ,
//                 Icon(hiddenText ?Icons.arrow_drop_down : Icons.arrow_drop_up , color: AppColors.mainColor,),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
