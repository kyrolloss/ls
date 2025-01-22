import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ls/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';

import '../../../../../try3.dart';
import '../../Exercise/view/exercise.dart';

class PersonView extends StatefulWidget {
  const PersonView({super.key});

  @override
  State<PersonView> createState() => _PersonViewState();
}
// ignore: camel_case_typessafasd
class _PersonViewState extends State<PersonView>
    with SingleTickerProviderStateMixin {
  bool _isFlipped = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  late double width;
  late double height;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipImage() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: FloatingActionButton(
                    onPressed: (){
                      ExerciseCubit.get(context).getExercise(query: {
                        "Warmup": "true"
                      }) ;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutScreen(bodyPartID: '',)));
                    },
                    child: Icon(Iconsax.tag_right),
                  ),
                ),
                Text('WormUP')
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: _flipImage,
                  child: Icon(Icons.flip),
                ),
                Text('Flip')
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: AnimatedOpacity(
                  opacity: !_isFlipped ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  child: Image.asset(
                    'assets/images/Person back.png',
                    width: width * 0.8,
                    height: height * 0.8,
                  ),
                ),
              ),
              Center(
                child: AnimatedOpacity(
                  opacity: !_isFlipped ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  child: Image.asset(
                    'assets/images/Person.jpeg',
                    width: width * 0.8,
                    height: height * 0.8,
                  ),
                ),
              ),
              !_isFlipped
                  ? Positioned(
                  top: height * .185,
                  right: width * .205,
                  child: GestureDetector(
                    onTap: () {
                      ExerciseCubit.get(context).result2 =
                      '67399428c913a95d941668d2';
                      ExerciseCubit.get(context).generateFilterMap(page: 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutScreen(bodyPartID: '67399428c913a95d941668d2',)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Nick',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ExpandingWave(),
                            Container(
                              width: width * .25,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
                  : SizedBox(),
              !_isFlipped
                  ? Positioned(
                  top: height * .21,
                  left: width * .0925,
                  child: GestureDetector(
                    onTap: () {
                      ExerciseCubit.get(context).result2 =
                      '67399428c913a95d941668d3';
                      ExerciseCubit.get(context).generateFilterMap(page: 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutScreen(bodyPartID: '67399428c913a95d941668d3',)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'shoulders',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: width * .25,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                            ExpandingWave(),
                          ],
                        ),
                      ],
                    ),
                  ))
                  : Positioned(
                  top: height * .19,
                  left: width * .125,
                  child: GestureDetector(
                    onTap: () {
                      // ExerciseCubit.get(context).result2 = '67399428c913a95d941668d3';
                      // ExerciseCubit.get(context).generateFilterMap();
                      // Navigator.push(context, MaterialPageRoute(builder: (context) =>  WorkoutScreen()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trabs',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: width * .3,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                            ExpandingWave(),
                          ],
                        ),
                      ],
                    ),
                  )),
              !_isFlipped
                  ? Positioned(
                  top: height * .225,
                  right: width * .0925,
                  child: GestureDetector(
                    onTap: () {
                      ExerciseCubit.get(context).result2 =
                      '67399428c913a95d941668d0';
                      ExerciseCubit.get(context).generateFilterMap(page: 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutScreen(bodyPartID: '67399428c913a95d941668d0',)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Chest',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ExpandingWave(),
                            Container(
                              width: width * .315,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
                  : Positioned(
                  top: height * .285,
                  left: width * .093,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lats',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: width * .325,
                            height: height * .006,
                            color: Colors.black.withOpacity(.5),
                          ),
                          ExpandingWave(),
                        ],
                      ),
                    ],
                  )),
              !_isFlipped
                  ? Positioned(
                  top: height * .26,
                  left: width * .075,
                  child: GestureDetector(
                    onTap: () {
                      ExerciseCubit.get(context).result2 =
                      '673a542bc913a95d94166edf';
                      ExerciseCubit.get(context).generateFilterMap(page: 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutScreen(bodyPartID: '673a542bc913a95d94166edf',)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Biceps',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: width * .25,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                            ExpandingWave(),
                          ],
                        ),
                      ],
                    ),
                  ))
                  : Positioned(
                  top: height * .26,
                  right: width * .08,
                  child: GestureDetector(
                    onTap: () {
                      ExerciseCubit.get(context).result2 =
                      '67399428c913a95d941668d9';
                      ExerciseCubit.get(context).generateFilterMap(page: 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutScreen(bodyPartID: '67399428c913a95d941668d9',)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Triceps',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ExpandingWave(),
                            Container(
                              width: width * .225,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              !_isFlipped
                  ? Positioned(
                  top: height * .32,
                  left: width * .025,
                  child: GestureDetector(
                    onTap: () {
                      ExerciseCubit.get(context).result2 =
                      '67399428c913a95d941668d7';
                      ExerciseCubit.get(context).generateFilterMap(page: 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutScreen(bodyPartID: '67399428c913a95d941668d7')));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forearms',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: width * .21,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                            ExpandingWave(),
                          ],
                        ),
                      ],
                    ),
                  ))
                  : SizedBox(),
              !_isFlipped
                  ? Positioned(
                  top: height * .29,
                  right: width * .125,
                  child: GestureDetector(
                    onTap: () {
                      ExerciseCubit.get(context).result2 =
                      '67399428c913a95d941668dc';
                      ExerciseCubit.get(context).generateFilterMap(page: 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutScreen(bodyPartID: '67399428c913a95d941668dc',)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Abs',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ExpandingWave(),
                            Container(
                              width: width * .35,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
                  : Positioned(
                  top: height * .33,
                  right: width * .08,
                  child: GestureDetector(
                    onTap: () {
                      ExerciseCubit.get(context).result2 =
                      '674078d89f0d1eedab574aae';
                      ExerciseCubit.get(context).generateFilterMap(page: 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutScreen(bodyPartID: '674078d89f0d1eedab574aae',)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Lower Back',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ExpandingWave(),
                            Container(
                              width: width * .35,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              !_isFlipped
                  ? Positioned(
                  top: height * .385,
                  left: width * .235,
                  child: GestureDetector(
                    onTap: () {
                      ExerciseCubit.get(context).result2 =
                      '674078d89f0d1eedab574aae';
                      ExerciseCubit.get(context).generateFilterMap(page: 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutScreen(bodyPartID: '674078d89f0d1eedab574aae',)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Adductors',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: width * .21,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                            ExpandingWave(),
                          ],
                        ),
                      ],
                    ),
                  ))
                  : Positioned(
                  top: height * .385,
                  left: width * .225,
                  child: GestureDetector(
                    onTap: () {
                      ExerciseCubit.get(context).result2 =
                      '674078d89f0d1eedab574aaa';
                      ExerciseCubit.get(context).generateFilterMap(page: 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutScreen(bodyPartID: '674078d89f0d1eedab574aaa',)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Glutes',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: width * .225,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                            ExpandingWave(),
                          ],
                        ),
                      ],
                    ),
                  )),
              !_isFlipped
                  ? Positioned(
                  top: height * .425,
                  right: width * .15,
                  child: GestureDetector(
                    onTap: () {
                      ExerciseCubit.get(context).result2 =
                      '67399428c913a95d941668d5';
                      ExerciseCubit.get(context).generateFilterMap(page: 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutScreen(bodyPartID: '67399428c913a95d941668d5',)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Quads',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ExpandingWave(),
                            Container(
                              width: width * .25,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
                  : Positioned(
                  top: height * .45,
                  right: width * .15,
                  child: GestureDetector(
                    onTap: () {
                      ExerciseCubit.get(context).result2 =
                      '67399428c913a95d941668d8';
                      ExerciseCubit.get(context).generateFilterMap(page: 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutScreen(bodyPartID: '67399428c913a95d941668d8')));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hamstrings',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ExpandingWave(),
                            Container(
                              width: width * .25,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              _isFlipped
                  ? Positioned(
                  top: height * .55,
                  left: width * .2,
                  child: GestureDetector(
                    onTap: () {
                      ExerciseCubit.get(context).result2 =
                      '67399428c913a95d941668db';
                      ExerciseCubit.get(context).generateFilterMap(page: 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutScreen(bodyPartID: '67399428c913a95d941668db',)));
                      ////////
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Calves',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .03,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: width * .25,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),
                            ),
                            ExpandingWave(),
                          ],
                        ),
                      ],
                    ),
                  ))
                  : SizedBox(),
            ],
            ),
        );
    }
}
