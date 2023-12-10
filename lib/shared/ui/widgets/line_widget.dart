import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../resources/size_config.dart';

class LineVerticalWidget extends StatelessWidget {
  LineVerticalWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1, width: double.infinity, color: AppColor.grey200);
  }
}

class LineHorizontalWidget extends StatelessWidget {
  const LineHorizontalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 80,
        width: 1,
        color: AppColor.grey200,
      ),
    );
  }
}

class LineHorizontaDivider extends StatelessWidget {
  const LineHorizontaDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Container(
        height: 1,
        width: SizeConfig.screenWidth,
        color: AppColor.grey200,
      ),
    );
  }
}
