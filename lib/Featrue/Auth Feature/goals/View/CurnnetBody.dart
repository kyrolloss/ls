import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/TargetWegiht.dart';
import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';
import 'experience.dart';
class BodyShapeSelectionPage extends StatefulWidget {
  @override
  _BodyShapeSelectionPageState createState() => _BodyShapeSelectionPageState();
}

class _BodyShapeSelectionPageState extends State<BodyShapeSelectionPage> {
  int _currentPageIndex = 0;

  final List<String> _images = [
    'assets/images/first.png',
    'assets/images/second.png',
    'assets/images/third.png',
    'assets/images/fourth.png',
    'assets/images/fifth.png',
  ];

  final List<String> _bodyFatTexts = [
    'Your Estimated Body Fat: <15%\nYou need to increase your nutrient intake and maintain muscle mass through exercise.',
    'Your Estimated Body Fat: 15-20%\nYou are at a normal body fat level! Try the personalized plan for you to keep your body active.',
    'Your Estimated Body Fat: 21-30%\nYour body fat percentage is slightly higher and you need to exercise properly to get back to a healthy level. ',
    'Your Estimated Body Fat: 31-40%\nThe current body fate rate is a bit high so lets start exercising to burn fat!',
    'Your Estimated Body Fat: >40%\nHigh body fat percentage may lead to health problems.Focus on fitness and diet!'
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.06),
                  child:
                  ProgressIndicatorWidget(
                    currentStep: 4,
                    totalSteps: 5,
                    currentPage: 1 ,
                    totalPages: 6,
                    pagesPerStep: [5, 5, 5, 5, 5,5,5],
                    width: screenWidth * 0.33,
                  )
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          // Title
          Text(
            'Body Data',
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          // What’s your current body shape? centered
          Text(
            'What’s your current body shape?',
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),

          Expanded(
            child: PageView.builder(
              itemCount: _images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      _images[index],
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: screenHeight * 0.02),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              _bodyFatTexts[_currentPageIndex],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: screenHeight*0.02,),

          // Continue button
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.05),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TargetWeightSelectionPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.3,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
