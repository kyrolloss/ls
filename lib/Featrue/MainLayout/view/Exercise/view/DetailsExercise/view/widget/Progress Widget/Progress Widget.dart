import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

import '../../../../../../Home/View/Progress Feature/View Model/progress_cubit.dart';
import '../Exercise button/Exercise button.dart';

class ProgressWidget extends StatefulWidget {
  final String id;
  ProgressWidget({super.key, required this.id});

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  TextEditingController? repsController;

  TextEditingController? weightController;

  @override
  void initState() {
    repsController = TextEditingController();
    weightController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    repsController!.dispose();
    weightController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(
          'Add your Reps & your Sets to track your progress',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          height: height * .05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BlocConsumer<ProgressCubit, ProgressState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ProgressCubit.get(context).progressModel != null ? SizedBox(
                  height: height * .3,
                  child: LineChart(
                    curve:  Curves.ease,
                    LineChartData(
                      baselineX: 0,
                      baselineY: 0,
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
                          spots: ProgressCubit.get(context).spots,
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
                  )) : Center(child: CircularProgressIndicator(color: kSecondColor,),);
  },
),
            ),
          ],
        ),
        SizedBox(
          height: height * .05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: width * .3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: kSecondColor),
              ),
              child: CupertinoTextFormFieldRow(
                controller: weightController,
                keyboardType: TextInputType.number,
                placeholder: 'Weight',
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                placeholderStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Container(
              width: width * .3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: kSecondColor),
              ),
              child: CupertinoTextFormFieldRow(
                controller: repsController,
                keyboardType: TextInputType.number,
                placeholder: 'Reps',
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                placeholderStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * .05),
        Row(
          children: [

            Expanded(
                child: ExerciseButton(
              onPressed: ()async {
                double reps = double.parse(repsController!.text);
                double weight = double.parse(weightController!.text);
                double volume = reps * weight;
                print(volume);

                repsController!.clear();
                weightController!.clear();
               await ProgressCubit.get(context).addProgress(
                    Volume: volume, id: widget.id);

              },
              label: 'Add',
            )),
          ],
        )
      ],
    );
  }
}
