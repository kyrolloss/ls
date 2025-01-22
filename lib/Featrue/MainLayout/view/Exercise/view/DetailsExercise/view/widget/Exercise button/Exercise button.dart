import 'package:flutter/material.dart';

import '../../../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';

class ExerciseButton extends StatelessWidget {
  final String label;
  final Function? onPressed;

  const ExerciseButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        onPressed!();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: kSecondColor,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
