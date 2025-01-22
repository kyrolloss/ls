import 'package:flutter/material.dart';
import 'package:ls/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

class FoodDetailPage extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final String method;
  final String protein;
  final String carbs;
  final String creatine;

  FoodDetailPage({
    required this.name,
    required this.image,
    required this.description,
    required this.method,
    required this.protein,
    required this.carbs,
    required this.creatine,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kThirdColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Image section
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(screenWidth * 0.05),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: screenHeight * 0.35,
                width: screenWidth,
              ),
            ),
            // Back button on top of the image
            Positioned(
              top: screenHeight * 0.03,
              left: screenWidth * 0.05,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            // Content below the image
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.35 + screenHeight * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: screenHeight * 0.03),

                  // Food title and details
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.030),

                        // Calories, Protein, Carbs
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: _buildIconInfo('assets/images/calories.png', 'Calories', '350', screenWidth),
                            ),
                            Flexible(
                              child: _buildIconInfo('assets/images/protein.png', 'Protein', protein, screenWidth),
                            ),
                            Flexible(
                              child: _buildIconInfo('assets/images/carb.png', 'Carbs', carbs, screenWidth),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.03),

                        // Description and Method
                        _buildDetailText("Description:", description, screenWidth),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'How to make it',
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                            color: kSecondColor,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        // Example steps (like the screenshot)
                        _buildStep('01', 'This Homemade Waffle Recipe is the perfect way to enjoy a lazy weekend morning!', screenWidth),
                        _buildStep('02', 'This Homemade Waffle Recipe is the perfect way to enjoy a lazy weekend morning!', screenWidth),
                        _buildStep('03', 'This Homemade Waffle Recipe is the perfect way to enjoy a lazy weekend morning!', screenWidth),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconInfo(String iconPath, String label, String value, double screenWidth) {
    return Row(
      children: [
        Image.asset(iconPath, width: screenWidth * 0.08, height: screenWidth * 0.08), // Icon image
        SizedBox(width: screenWidth * 0.02),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.04,
                color: Colors.grey[600],
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.045,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStep(String stepNumber, String stepDescription, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.12,
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                stepNumber,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.07),
          Expanded(
            child: Text(
              stepDescription,
              style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.white38),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildDetailText(String label, String value, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.05,
            color: kSecondColor,
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        Text(
          value,
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            color: Colors.white38,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
