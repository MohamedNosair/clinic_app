import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:talaky_app/modules/login_screen/login_screen.dart';
import 'package:talaky_app/shared/componants/componantes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:  [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.red,
        ),
        const SizedBox(height: 10,),
         Container(
          child:  const Center(child: Text("Talky App")),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: [
                Icon(
                  IconlyBroken.swap,
                ),
                SizedBox(width: 10,),
                Text(
                  "Language",
                ),
                Spacer(),
                Text(
                  "English",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
                Icon(
                  IconlyBroken.arrowRight2,
                  color: Colors.grey,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        myDivider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children:const [
                Icon(
                  IconlyBroken.infoCircle,
                ),
                SizedBox(width: 10,),
                Text(
                  "About",
                ),
                Spacer(),
                Icon(
                  IconlyBroken.arrowRight2,
                  color: Colors.grey,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        myDivider(),
        InkWell(
          onTap: (){
            navigateAndFinish(context, LoginScreen());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Icon(
                  IconlyBroken.logout,
                ),
                SizedBox(width: 10,),
                Text(
                  "Logout ",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
