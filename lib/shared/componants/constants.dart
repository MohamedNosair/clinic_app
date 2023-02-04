  import 'package:talaky_app/modules/login_screen/login_screen.dart';
import 'package:talaky_app/shared/componants/componantes.dart';
import 'package:talaky_app/shared/network/local/cachehelper/cache_helper.dart';

String? token = '';
String? uId = '';

  void signOut(context) {
    CacheHelper.removeData(
      key: 'token',
    ).then((value) {
      if (value) {
        print('uId');
        navigateAndFinish(
          context,
          LoginScreen(),
        );
      }
    });
  }