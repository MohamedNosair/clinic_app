import 'package:flutter/material.dart';
import '../../../shared/ui/resources/app_colors.dart';
import '../../../shared/ui/resources/app_image_paths.dart';
import '../../../shared/ui/resources/app_size.dart';
import '../../../shared/ui/resources/app_strings.dart';

class NotOrderScreen extends StatelessWidget {
  final bool? date;
  const NotOrderScreen({Key? key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Image Icon
          Image.asset(
            AppImages.notOrder,
          ),

          /// First text
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: AppText(
              text: date == null ? 'no_orders' : "no_orders_date",
              size: AppSize.size16,
            ),
          ),

          /// Text 2
          if (date == null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: AppText(
                text: 'Please_wait_for_the_request_to_be_sent_by_the_client',
                size: AppSize.size12,
                color: AppColor.greyColor,
              ),
            ),
        ],
      ),
    );
  }
}
