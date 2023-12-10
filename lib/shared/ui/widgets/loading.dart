import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class LoadingCircular extends StatelessWidget {
  const LoadingCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
          color: AppColor.mainColor,
        ));
  }
}
