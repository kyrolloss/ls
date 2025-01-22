import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:ls/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/Home/View/Progress%20Feature/View%20Model/progress_cubit.dart';

import '../../../../../Exercise/model/ExerciseModel.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  late Data selectedExercise;

  @override
  void initState() {
    super.initState();
    selectedExercise = ExerciseCubit.get(context).exercisesModel!.data[0];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Data> exercises = ExerciseCubit.get(context).exercisesModel!.data;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kThirdColor,
        title: Text(
          "Progress",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * .05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: DropdownButton<Data>(
                  style: TextStyle(color: Colors.black),
                  dropdownColor: kThirdColor,
                  value: selectedExercise,
                  items: exercises.map((Data exercise) {
                    return DropdownMenuItem<Data>(
                      value: exercise,
                      child: Text(
                        exercise.title,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (Data? newExercise) async {
                    setState(() {
                      selectedExercise = newExercise!;
                    });
                    await ProgressCubit.get(context)
                        .getExercisesProgress(id: selectedExercise.id!);
                    if (ProgressCubit.get(context)
                        .progressModel!
                        .data!
                        .isNotEmpty) {
                      ProgressCubit.get(context).generateSpots(
                          ProgressCubit.get(context).progressModel!);
                    }
                    else {
                      ProgressCubit.get(context).clearSpots();

                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * .15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: height * .4,
                  width: width * .95,
                  child: BlocConsumer<ProgressCubit, ProgressState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return LineChart(
                        curve: Curves.slowMiddle,
                        LineChartData(
                          baselineX: 0,
                          baselineY: 0,
                          clipData:  FlClipData.horizontal(),

                          rangeAnnotations:  RangeAnnotations(
                            horizontalRangeAnnotations: [
                              HorizontalRangeAnnotation(y1:   2  , y2: .5)
                            ]
                          ),
                          gridData: FlGridData(
                            show: false,
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              color: Colors.transparent,
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: [kSecondColor, Colors.white],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              dotData: FlDotData(show: false),
                              spots: ProgressCubit.get(context).spots == [
                                FlSpot(0, 5)
                              ] ? [] : ProgressCubit.get(context).spots,
                              isCurved: true,
                              barWidth: 2,
                            )
                          ],
                          lineTouchData: LineTouchData(
                            enabled: false,
                          ),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                interval: 50,
                                reservedSize: width * .07,
                                showTitles: true,
                                minIncluded: false,
                                maxIncluded: false,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: TextStyle(color: Colors.white),
                                  );
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 10,
                                minIncluded: false,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: TextStyle(color: Colors.white),
                                  );
                                },
                              ),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                      );
                    },
                  )),
            ],
          )
        ],
      ),
    );
  }
}
