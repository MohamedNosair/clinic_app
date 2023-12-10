import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  const MyTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Tab(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: const [
                Text(
                  "Friday",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                Text(
                  "30",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    fontFamily: ""
                  ),
                ),
                Text("jan",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
