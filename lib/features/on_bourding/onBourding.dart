import 'package:brain_tumor/core/utils/color_mange.dart';

import 'package:brain_tumor/core/utils/images_mange.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/helper/cash_helper.dart';
import '../authentication/presentation/pages/login_screen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: ImageAssets.onboarding1,
      title: 'Before undergoing magnetic resonance imaging (MRI)',
      body:
          '''You must follow instructions and guidelines. You will be asked to fill out a patient history form before your exam.
  Tell your doctor and the MRI technologist if you have any metal objects inside of your body and if you suffer from claustrophobia (fear of being closed in).''',
    ),
    BoardingModel(
      image: ImageAssets.onboarding2,
      title: 'During the MRI',
      body: ''' Stay relaxed when taking MRI. movement can distort the image.
The MRI unit looks like a large metal donut.
A coil might be placed around the part of your body being scanned such as Brain.
If you feel anything uncomfortable during the scan, tell the MRI technologist.
 ''',
    ),
    BoardingModel(
      image: ImageAssets.onboarding3,
      title: 'After the MRI',
      body:
          'The pictures taken during the test will be reviewed by MRI specialist. Your results will then be given to your doctor, who will discuss them with you.',
    ),
  ];

  bool isLast = false;

  var boardingController = PageController();

  void submit() {
    CashHelper.saveData(key: 'OnBoarding', value: true).then((value) {
      if (value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: submit,
              child: Text(
                'Skip',
                style: TextStyle(color: ColorManger.defaultColor),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
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
                controller: boardingController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildBoarding(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: ColorManger.defaultColor,
                      expansionFactor: 3,
                      spacing: 5,
                      dotWidth: 10,
                      dotHeight: 10,
                    ),
                    controller: boardingController,
                    count: boarding.length),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    }
                    boardingController.nextPage(
                        duration: const Duration(milliseconds: 720),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                  label: const Text('Next'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoarding(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(model.image)),
          const SizedBox(
            height: 30,
          ),
          Text(
            model.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            model.body,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      );
}
