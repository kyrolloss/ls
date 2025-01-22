import 'package:flutter/material.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/CurnnetBody.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/View/experience.dart';
import 'package:ls/Featrue/Auth%20Feature/goals/viewModel/goals_cubit.dart';
import '../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../Widgets/View/ProgressIndicator.dart';

class TargetWeightSelectionPage extends StatefulWidget {
  @override
  _TargetWeightSelectionPageState createState() => _TargetWeightSelectionPageState();
}

class _TargetWeightSelectionPageState extends State<TargetWeightSelectionPage> {
  double selectedWeightKg = 40;
  bool isKg = true;
  late FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController(initialItem: (selectedWeightKg - 40).toInt());
  }

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
                      currentPage: 2 ,
                      totalPages: 6,
                      pagesPerStep: [5, 5, 5, 5, 5,5,5],
                      width: screenWidth * 0.33,
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            'Body Data',
            style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Your target weight',
            style: TextStyle(
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(height: screenHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isKg = false;
                    scrollController.jumpToItem(((selectedWeightKg / 0.453592).round()) - 88);
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenWidth * 0.05),
                  decoration: BoxDecoration(
                    color: !isKg ? Colors.white : Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'LB',
                    style: TextStyle(color: !isKg ? Colors.black : Colors.white, fontSize: screenWidth * 0.04),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.05),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isKg = true;
                    scrollController.jumpToItem(selectedWeightKg.toInt() - 40);
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenWidth * 0.05),
                  decoration: BoxDecoration(
                    color: isKg ? Colors.white : Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'KG',
                    style: TextStyle(color: isKg ? Colors.black : Colors.white, fontSize: screenWidth * 0.04),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.05),
          Text(
            isKg ? '${selectedWeightKg.toStringAsFixed(1)} kg' : '${(selectedWeightKg / 0.453592).toStringAsFixed(1)} lb',
            style: TextStyle(fontSize: screenWidth * 0.08, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                ListWheelScrollView.useDelegate(
                  controller: scrollController,
                  itemExtent: 60,
                  physics: FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      if (isKg) {
                        selectedWeightKg = (index + 40).toDouble();
                      } else {
                        selectedWeightKg = ((index + 88) * 0.453592).toDouble();
                      }
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      final weight = isKg ? index + 40 : (index + 88);
                      final displayWeight = isKg ? '$weight kg' : '${(weight / 0.453592).round()} lb';
                      final isSelected = isKg ? weight == selectedWeightKg.toInt() : (weight == (selectedWeightKg / 0.453592).round());

                      return Text(
                        displayWeight,
                        style: TextStyle(
                          fontSize: isSelected ? screenWidth * 0.07 : screenWidth * 0.05,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.black : Colors.grey.shade400,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.05),
            child: ElevatedButton(
              onPressed: () {
                GoalsCubit.get(context).setTargetWeigth(
                  selectedWeightKg.toInt(),
                  isKg: isKg,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExperiencePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.3),
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
