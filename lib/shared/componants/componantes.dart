import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talaky_app/shared/style/color.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  bool isPassword = false,
  required TextInputType inputType,
  Function(String)? onSubmitted,
  String? text,
  required IconData prefix,
  String? Function(String?)? validate,
  // Color color = AppColor.mainColor,
  IconData? suffix,
  Function()? suffixOnPressed,
  Function(String)? onChange,
  Function()? onTap,
}) =>
    TextFormField(
      onTap: onTap,
      onChanged: onChange,
      validator: validate,
      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType,
      onFieldSubmitted: onSubmitted,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        fillColor: Colors.grey[100],
        // filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide:  const BorderSide(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        label: Text(
          '$text',
          style: TextStyle(
            color: Colors.grey[500],
            fontFamily: 'Medium',
          ),
        ),
        prefixIcon: Icon(
          prefix,
          color: Colors.grey,
        ),
        suffixIcon: IconButton(
          onPressed: suffixOnPressed,
          icon: Icon(
            suffix,
            color: AppColor.greyColor,

          ),
        ),
      ),
    );





Widget defaultButton({
  // double height = 50.0,
  double width = double.infinity,
  required Color color ,
  double? radius,
  required Function() onPressed,
  required String? text,
}) =>
    Container(
      // height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: MaterialButton(
        enableFeedback: true,
        onPressed: onPressed,
        child: Text(
          '$text',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultTextButton({
  required Function()? function,
  required String text,
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  double? height,
  Color? background,
  IconData? icon,
}) =>
    Row(
      children: [
        TextButton(
          onPressed: function,
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: AppColor.blackColor,
                ),
              ),
              Icon(
                icon,
                color: defaultColor,
                size: 18,
              ),
            ],
          ),
        ),
      ],
    );

Widget myDivider() => Container(
      width: double.infinity,
      height: 2,
      color: defaultSecondColor,
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

void showToast({
  required String text,
  ToastState? state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state!),
        textColor: Colors.white,
        fontSize: 16.0);

//enum

// ignore: constant_identifier_names
enum ToastState { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
Widget buildNotConnected() {
  return Center(
    child: Container(
      height: 250,
      width: 250,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/no_internet.gif"),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget buildNotConnectedScreen({
   required screen,
}
    ){
  return OfflineBuilder(
    connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
        ) {
      final bool connected = connectivity != ConnectivityResult.none;
      if (connected) {
        return screen;
      }else{
        return buildNotConnected() ;
      }
    },
    child:  const Text("no internet"),

  );

}

Widget progressIndicator(){
  return CircularProgressIndicator(
    color:  AppColor.mainColor,
    backgroundColor: Colors.pinkAccent,
    semanticsLabel: "loading",
    semanticsValue: "mohamed",

  ) ;
}