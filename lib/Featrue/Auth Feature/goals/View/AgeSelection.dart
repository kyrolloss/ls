import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/gender.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/viewModel/goals_cubit.dart';
import 'package:ls/generated/l10n.dart';

import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';

// Updated AgeSelectionPage
class AgeSelectionPage extends StatefulWidget {
  @override
  _AgeSelectionPageState createState() => _AgeSelectionPageState();
}

class _AgeSelectionPageState extends State<AgeSelectionPage> {
  int selectedAge = 20; // Default starting age
  bool isAgeSelected = false; // Track if age is selected

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical:screenHeight * 0.06 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight*0,),
                ProgressIndicatorWidget(
                  currentStep: 0,
                  totalSteps: 5,
                  currentPage: 1, // الصفحة الحالية داخل الخطوة
                  totalPages: 6, // إجمالي صفحات الخطوة الحالية
                  pagesPerStep: [5, 5, 5, 5, 5,5,5], // عدد الصفحات لكل خطوة
                  width: screenWidth * 0.33,
                ),

                SizedBox(height: screenHeight * 0.06),
                // Title
                Text(
                  S.of(context).AgeSelection_Body_Data,
                  style: TextStyle(
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02),
                // Age selection header
                Text(
                  S.of(context).AgeSelection_Age,
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  S.of(context).AgeSelection_Age_Information,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05),
                // Age selection wheel
                SizedBox(
                  height: screenHeight * 0.3,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: screenHeight * 0.08,
                    diameterRatio: 1.5,
                    perspective: 0.002,
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedAge = index + 14; // Assuming age starts from 14
                        GoalsCubit.get(context).setAge(selectedAge); // Store age in cubit
                        isAgeSelected = true; // Mark age as selected
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        final age = index + 14; // Starting age from 14
                        return FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '$age years old',
                            style: TextStyle(
                              fontSize: age == selectedAge
                                  ? screenWidth * 0.07
                                  : screenWidth * 0.05,
                              fontWeight: age == selectedAge
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: age == selectedAge
                                  ? Colors.black
                                  : Colors.grey.shade400,
                            ),
                          ),
                        );
                      },
                      childCount: 86, // Adjust this based on your age range
                    ),
                  ),
                ),
                // Continue button
                SizedBox(height: screenHeight * 0.05),
                ElevatedButton(
                  onPressed: isAgeSelected
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Gender(),
                      ),
                    );
                  }
                      : null, // Disable button if age is not selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(screenWidth * 0.7, screenHeight * 0.06),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    S.of(context).Continue,
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

