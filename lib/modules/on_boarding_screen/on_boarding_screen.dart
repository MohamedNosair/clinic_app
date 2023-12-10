import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:talaky_app/modules/login_screen/login_screen.dart';
import 'package:talaky_app/shared/componants/componantes.dart';
import 'package:talaky_app/shared/network/local/cachehelper/cache_helper.dart';

import '../../shared/ui/resources/app_colors.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/image/onboarding.png',
      title: 'مرحبا بك ',
      body: 'On Boarding 1 Body',
    ),
    BoardingModel(
      image: 'assets/image/onboarding.png',
      title: 'On Boarding 2 Title ',
      body: 'On Boarding 2 Body',
    ),
    BoardingModel(
      image: 'assets/image/onboarding.png',
      title: 'On Boarding 3 Title ',
      body: 'On Boarding 3 Body',
    ),
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      navigateAndFinish(
        context,
        LoginScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0 ,
        actions: [
          defaultTextButton(
            function: submit,
            text: 'تخطى',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect:  ExpandingDotsEffect(
                    activeDotColor:  AppColor.mainColor,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 10,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor:  AppColor.mainColor,
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child:  const Icon(
                    IconlyBroken.arrowRight2,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Expanded(
            child: Image(
              image: AssetImage("assets/image/onboarding.png"),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Text(
            model.title,
            style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'arabic',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            model.body,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'arabic',
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      );
}
