import 'package:flutter/material.dart';
import 'package:talaky_app/modules/appointment_screen/appointment_screen/widgets/my_tab.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myTabs = [
      MyTab(),
      MyTab(),
      MyTab(),
      MyTab(),
      MyTab(),
      MyTab(),
      MyTab(),

    ];
    return Scaffold(
      appBar: AppBar(),
      body: DefaultTabController(
        length: myTabs.length,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.deepPurple,
              physics: const BouncingScrollPhysics(),
              enableFeedback: true,
              // labelColor: Colors.lightBlue,
              // unselectedLabelColor: Colors.deepPurple,
              padding: const EdgeInsets.all(8),
              isScrollable: true,
              indicator: BoxDecoration(),
              tabs: myTabs,
            ),
            // TabBarView(
            //   children: [
            //
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
