import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_flutter_app/constans.dart';
import 'package:task_flutter_app/modules/components.dart';
import 'package:task_flutter_app/modules/registeration_screen.dart';

class BoardingModel {
  String image;
  String title;
  String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatelessWidget {
  @override
  var boardController = PageController();
  bool isLast = false;
  List<BoardingModel> bording = [
    BoardingModel(
        image: "assets/images/onboarding1.jpeg",
        title: "شحناتك تصل الى اى مكان",
        body: "جهز شحناتك .... تصل لأي مكان"),
    BoardingModel(
        image: "assets/images/onboarding1.jpeg",
        title: "شحناتك تصل الى اى مكان",
        body: "جهز شحناتك .... تصل لأي مكان"),
    BoardingModel(
        image: "assets/images/onboarding2.jpeg",
        title: "افضل نظام لتتبع شحناتك",
        body: "شحناتك معاك فى اى وقت وفى اى مكان"),
    BoardingModel(
        image: "assets/images/onboarding3.jpeg",
        title: "أفضل مندوبي توصيل",
        body: "نظام تقييمات كامل على أداء المندوب"),
  ];
  void submit(context) {
    navigateAndFinsh(context, RegistrationScreen());
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              onPageChanged: (index) {
                if (index == bording.length - 1) {
                  isLast = true;
                } else
                  isLast = false;
              },
              controller: boardController,
              itemBuilder: (context, index) =>
                  buildBoardingItem(bording[index], bording.length),
              itemCount: bording.length,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Spacer(),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        submit(context);
                      },
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 30),
                        child: Text(
                          "تجاوز",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      )),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        submit(context);
                      } else {
                        boardController.nextPage(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }

  Widget buildBoardingItem(BoardingModel bording, int boardinglength) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(image: AssetImage(bording.image)),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            bording.title,
            style: TextStyle(fontSize: 24, color:PrimaryColor),
          )),
          SizedBox(
            height: 15,
          ),
          Center(
              child: Text(
            bording.body,
            style: TextStyle(fontSize: 14),
          )),
          SizedBox(
            height: 15,
          ),
          Center(
            child: SmoothPageIndicator(
                controller: boardController,
                // ignore: prefer_const_constructors
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: PrimaryColor,
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 2,
                  spacing: 5,
                ),
                count: boardinglength),
          ),
        ],
      );
}
