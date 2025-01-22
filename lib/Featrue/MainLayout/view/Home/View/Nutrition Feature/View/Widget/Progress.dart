import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

import '../../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../View Model/nutrition_cubit.dart';

class ProgressPercentage extends StatelessWidget {
  const ProgressPercentage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<NutritionCubit, NutritionState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return RoundedProgressBar(
          key: ValueKey(NutritionCubit.get(context).calories.toDouble()),
            childCenter: Text(
              '${(NutritionCubit.get(context).calories.toInt())} cal ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: width * .04,
                  fontWeight: FontWeight.bold
              )),
            milliseconds: 1000,
            percent: NutritionCubit.get(context).calories.toDouble(),
            height: height * .05,
            margin: EdgeInsets.symmetric(horizontal: width * .05),
            style: RoundedProgressBarStyle(
                colorProgress: NutritionCubit.get(context).calories >50? Colors.red:Colors.deepPurpleAccent,
                colorProgressDark: Colors.deepPurpleAccent,
                colorBorder: NutritionCubit.get(context).calories >50? Colors.red:Colors.deepPurpleAccent,
                colorBackgroundIcon: Colors.deepPurpleAccent,
                backgroundProgress: Colors.deepPurpleAccent,
                borderWidth: 1),
            borderRadius: BorderRadius.circular(24));
      },
    );
  }
}
