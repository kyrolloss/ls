import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/Body%20dimensions%20measurement.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/viewModel/goals_cubit.dart';
import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';
import 'WeightSelection.dart';
class HeightSelectionPage extends StatefulWidget {
  @override
  _HeightSelectionPageState createState() => _HeightSelectionPageState();
}

class _HeightSelectionPageState extends State<HeightSelectionPage> {
  int selectedHeightCm = 170;
  bool isCm = true;

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
                    currentStep: 1,
                    totalSteps: 5,
                    currentPage: 3, // الصفحة الحالية داخل الخطوة
                    totalPages: 6, // إجمالي صفحات الخطوة الحالية
                    pagesPerStep: [5, 5, 5, 5, 5,5,5], // عدد الصفحات لكل خطوة
                    width: screenWidth * 0.33,
                  ),
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
                color: Colors.black),
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Your height',
            style: TextStyle(
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            'Height information helps us calculate your BMI more accurately',
            style: TextStyle(
                fontSize: screenWidth * 0.04, color: Colors.grey.shade500),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.05),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isCm = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.05),
                  decoration: BoxDecoration(
                    color: !isCm ? Colors.white : Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'FT',
                    style: TextStyle(
                        color: !isCm ? Colors.black : Colors.white,
                        fontSize: screenWidth * 0.04),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.05),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isCm = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.05),
                  decoration: BoxDecoration(
                    color: isCm ? Colors.white : Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'CM',
                    style: TextStyle(
                        color: isCm ? Colors.black : Colors.white,
                        fontSize: screenWidth * 0.04),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.05),

          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: screenHeight * 0.10 - _getImagePosition(),
                  child: Image.asset(
                    'assets/images/height.png',
                    width: screenWidth * 0.7,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  right: 10,
                  child: SizedBox(
                    height: screenHeight * 0.5,
                    width: screenWidth * 0.3,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: screenHeight * 0.08,
                      diameterRatio: 1.5,
                      perspective: 0.002,
                      physics: FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          if (isCm) {
                            selectedHeightCm = index + 120;
                          } else {
                            selectedHeightCm = (index * 12) + 120;
                          }
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) {
                          final height = isCm ? (index + 120) : (index + 4);
                          final displayHeight = isCm ? '$height cm' : '$height ft';
                          return Center(
                            child: Text(
                              displayHeight,
                              style: TextStyle(
                                fontSize: height == selectedHeightCm
                                    ? screenWidth * 0.07
                                    : screenWidth * 0.05,
                                fontWeight: height == selectedHeightCm
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: height == selectedHeightCm
                                    ? Colors.black
                                    : Colors.grey.shade400,
                              ),
                            ),
                          );
                        },
                        childCount: isCm ? 101 : 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Continue button
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.05),
            child: ElevatedButton(
              onPressed: () {
                String heightUnit = isCm ? 'cm' : 'ft';
                GoalsCubit.get(context).setLength(selectedHeightCm, heightUnit); // تمرير الطول والوحدة
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BodyMeasurementsPage(),
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


  double _getImagePosition() {
    if (isCm) {
      return (selectedHeightCm - 155) * 1.5;
    } else {
      return ((selectedHeightCm - 120) / 12) * 1.5;
    }
  }
}
