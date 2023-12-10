import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_strings.dart';

class AppTextButton extends StatelessWidget {
  String? text;
  Color? backgroundColor;
  Color? borderColor;
  Color? fontColor;
  Function? function;
  double? width;

  AppTextButton({
    Key? key,
    required this.text,
    this.backgroundColor,
    this.fontColor,
    this.borderColor,
    this.function,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 44.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        color: backgroundColor ?? AppColor.mainColor,
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: borderColor ?? AppColor.mainColor,
          ),
        ),
        onPressed: () {
          function!();
        },
        child: AppText(
          text: text,
          color: fontColor ?? Colors.white,
          size: 16,
        ),
      ),
    );
  }
}

class AppTextButtonBorder extends StatelessWidget {
  String? text;
  Function? function;
  double? width;

  AppTextButtonBorder({Key? key, required this.text, this.function, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 44.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        color: AppColor.transparentColor,
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: AppColor.grey300,
            width: 1,
          ),
        ),
        onPressed: () {
          function!();
        },
        child: AppText(
          text: text,
          color: AppColor.grey700,
          size: 16,
        ),
      ),
    );
  }
}

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  required Function validate,
  required String suffixText,
  String? prefix,
  IconData? suffix,
  bool isPassword = false,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      enabled: isClickable,
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit!(),
      onChanged: (s) {
        onChange!(s);
      },
      validator: (s) {
        validate(s);
      },
      decoration: InputDecoration(
        // suffixText: suffixText,
        suffixIcon: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(text: suffixText),
          ],
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.grey300),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.grey800),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.grey800),
        ),
      ),
    );

Widget PriceAddTextField({
  TextEditingController? controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onsaved,
  Function()? onTap,
  required Function validate,
  required String suffixText,
  String? prefix,
  IconData? suffix,
  FocusNode? focusNode,
  bool isPassword = false,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColor.grey300,
                  width: 1.0,
                ),
                right: BorderSide(
                  color: AppColor.grey300,
                  width: 1.0,
                ),
                left: BorderSide(
                  color: AppColor.grey300,
                  width: 0,
                ),
                top: BorderSide(
                  color: AppColor.grey300,
                  width: 1.0,
                ),
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
              ],
              focusNode: focusNode,
              enabled: isClickable,
              obscureText: isPassword,
              // controller: controller,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onFieldSubmitted: onSubmit!(),
              onChanged: (s) {
                onChange!(s);
              },
              onTap: onTap,
              validator: (s) {
                validate(s);
              },
              onSaved: (v) {
                onsaved!(v);
              },
              decoration: InputDecoration(
                hintText: "مثال : 50",
                hintStyle: TextStyle(color: AppColor.grey400),
                // suffixText: suffixText,
                prefixIcon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      prefix!,
                      style: TextStyle(color: AppColor.grey500),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                contentPadding: const EdgeInsets.all(8),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.grey800),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.grey800),
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12), topLeft: Radius.circular(12)),
            border: Border(
              left: BorderSide(color: AppColor.grey300, width: 1),
              top: BorderSide(color: AppColor.grey300, width: 1),
              bottom: BorderSide(color: AppColor.grey300, width: 1),
              right: BorderSide(color: AppColor.grey300, width: 0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: suffixText,
                  color: AppColor.grey500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
