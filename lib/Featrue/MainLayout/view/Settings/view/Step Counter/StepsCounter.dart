import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../View Model/counter_cubit.dart';
import 'Widget/HexagonPainter.dart';

class StepCounterPage extends StatefulWidget {
  @override
  _StepCounterPageState createState() => _StepCounterPageState();
}

class _StepCounterPageState extends State<StepCounterPage> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?';
  int _totalSteps = 0;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    _totalSteps = 0;
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _startStepCounting();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permission to access step count is denied')),
      );
    }
  }
  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }
  void _startStepCounting() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen((StepCount event) {
      if (mounted) {
        setState(() {
          _totalSteps = event.steps;
        });
      }
    }, onError: (error) {
      // Handle error
      print("Error: $error");
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Step Counter',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomPaint(
                              size: Size(200, 200),
                              painter: HexagonPainter(Color(0xFF40D876)),
                            ),
                            Column(
                              children: [
                                Text(
                                  "${_totalSteps - CounterCubit.get(context).counter} ",
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Step",
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text('Target : ' , style: TextStyle(
                              color: Colors.white,
                              fontSize: width * .05,
                              fontWeight: FontWeight.bold
                            ),),
                            Text('${CounterCubit.get(context).step}' , style: TextStyle(
                              color: Colors.white,
                              fontSize: width * .05,
                              fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              CounterCubit.get(context).DeleteData();
                              CounterCubit.get(context).SetCounter(value: _totalSteps);

                            },
                            icon: Icon(Icons.restart_alt,
                                color: Colors.grey, size: 50)),
                      ],
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: CupertinoTextField(
                            keyboardType: TextInputType.number,
                            cursorColor: Color(0xFF40D876),
                            padding: EdgeInsets.all(15),
                            placeholder: "Add Target Steps",
                            style: TextStyle(color: Colors.white),
                            placeholderStyle: TextStyle(color: Colors.white),
                            controller: controller,
                            decoration: BoxDecoration(
                              color: kThirdColor,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.white30, width: .25),
                            ),
                            strutStyle: StrutStyle(height: 1.5),
                            autocorrect: true,
                          )),
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        if (controller.text.isEmpty) {
                          return;
                        } else {
                          CounterCubit.get(context)
                              .SetData(value: int.parse(controller.text));
                          controller.clear();
                        }
                      },
                      child: Container(
                        height: height * .055,
                        width: width * .35,
                        decoration: BoxDecoration(
                          color: Color(0xFF40D876),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Set',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * .05,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
