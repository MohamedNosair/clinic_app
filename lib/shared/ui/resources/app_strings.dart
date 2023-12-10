import 'package:flutter/material.dart';
import 'package:talaky_app/core/language/app_localization/app_localization.dart';

class AppText extends StatelessWidget {
  String? text;
  double? size;
  Color? color;
  double? height;
  FontWeight? weight = FontWeight.w500;
  int? maxLines;
  TextOverflow? overflow;
  AppText({
    required this.text,
    this.size,
    this.color,
    this.height,
    this.maxLines,
    this.overflow,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!.tr(context),
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        color: color,
        height: height,
        fontWeight: weight,
      ),
    );
  }
}
