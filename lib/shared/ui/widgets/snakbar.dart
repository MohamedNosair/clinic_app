import 'package:flutter/material.dart';
class SnackBarWidget extends StatelessWidget {
   SnackBarWidget({Key? key, this.backgroundColor,this.content}) : super(key: key);
    Text ? content ;
    Color? backgroundColor ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child:SnackBar(
          content: content!,
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}
