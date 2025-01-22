import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../../try2.dart';

class TodayWorkOutView extends StatefulWidget {
  const TodayWorkOutView({super.key});

  @override
  State<TodayWorkOutView> createState() => _TodayWorkOutViewState();
}

class _TodayWorkOutViewState extends State<TodayWorkOutView> {
  bool? value1 = false;
  bool? value2 = false;
  bool? value3 = false;
  final AudioPlayer audioPlayer = AudioPlayer();
  final List<String> steps = ["PATTERN", "GOAL", "USERS", "SUCCESS", "RESOURCES"];
  final List<bool> completed = [true, true, true, false, false];
  void _playAudio() async {

    await Permission.audio.request();
    PermissionStatus status = await Permission.storage.request();

    if(await status.isGranted)
    {
      AudioPlayer audio = AudioPlayer();

      audio.play(AssetSource('records/recode.mp3'));
    }  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Today WorkOut",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: width,
                height: height * .5,
                child: Stack(
                  children: [
                    Container(
                      height: height * .45,
                      width: width,
                      color: Color(0xffF5F5DC),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                              image: AssetImage(
                                  'assets/images/Today Workout.png')),
                        ],
                      ),
                    ),

                    Positioned(
                      bottom: height * .025,
                      left: width * .17,
                      right: width * .17,
                      child: Container(
                          height: height * .2,
                          width: width * .8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://img.freepik.com/free-photo/young-powerful-sportsman-training-with-dumbbells-black-wall_176420-550.jpg?t=st=1732686929~exp=1732690529~hmac=a7687fc4c31249aee0204c7ddf15f6e438da8159c876e7416419bc42c2dab9d8&w=900'),
                                fit: BoxFit.cover,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PRO Split',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '75 m',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                    Positioned(
                      top: height * .025,
                      right: width * .1,

                      child:CircularPercentIndicator(

                        radius: 50.0,
                        lineWidth: 10.0,
                        percent: 0.8,
                        arcBackgroundColor: Colors.black,
                        backgroundColor: Colors.green,
                        progressColor: Colors.green,
                        arcType:  ArcType.HALF,
                        header: new Text("Workout Progress",style: TextStyle(color: Colors.black , fontWeight: FontWeight.w600),),

                                          ),)
                  ],
                )),
            SizedBox(
              height: height * .01,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Worm Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(

                          activeColor: Colors.green,
                          value: value1, onChanged: (_){
                        setState(() {
                          if (_ == false)
                            {
                              value1 = false;
                            }
                          else
                            {
                              value1 = true;
                              _playAudio();

                            }
                        });
                      })
                    ],
                  ),
                  SizedBox(
                    height: height * .0125,
                  ),
                  Container(
                      height: height * .2,
                      width: width * .45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/free-photo/legs-muscular-man-with-skipping-rope-training-kickboxing-black_155003-16608.jpg?t=st=1732750013~exp=1732753613~hmac=086af2fa62c31cc6133c4b6ba4701e12d11bd853b2a86ef6adf237cb4ae8471e&w=360'),
                            fit: BoxFit.cover,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jumping rope',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '5 m',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )),


                  SizedBox(
                    height: height * .05,
                  ),
                  Divider(),
                  SizedBox(
                    height: height * .05,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child:
                    Text(
                      '2 minutes of rest',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .015,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Text(
                        'Chest',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(

                          activeColor: Colors.green,
                          value: value3, onChanged: (_){
                        setState(() {
                          if (_ == false)
                          {
                            value3 = false;
                          }
                          else
                          {
                            value3 = true;
                            _playAudio();

                          }
                        });
                      }),
                    ],
                  ),
                  SizedBox(
                    height: height * .0125,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: height * .2,
                          width: width * .45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://img.freepik.com/free-photo/muscular-man-gym_144627-3325.jpg?t=st=1732750625~exp=1732754225~hmac=a51604bfeaaacd9bdba6abd9923c578a4fad0777a9b3c39c185db41eb35f98c7&w=900',
                                ),
                                fit: BoxFit.cover,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2.5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        'Incline Chest Press',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '3 Sets',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )),
                      Container(
                          height: height * .2,
                          width: width * .45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://img.freepik.com/free-photo/athlete-gym-swings-triceps-with-barbell-sports-lifestyle_169016-61178.jpg?t=st=1732750997~exp=1732754597~hmac=57945a3f32daec59b76eb4b20839442202eaefb63ea1d296842f8b6942d668a7&w=900',
                                ),
                                fit: BoxFit.cover,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2.5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        'Flat Chest Press',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '3 Sets',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Align(
                    alignment: Alignment.center,

                    child: Container(
                        height: height * .2,
                        width: width * .45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://img.freepik.com/free-photo/young-man-with-six-packs-working-out_23-2148284816.jpg?t=st=1732752243~exp=1732755843~hmac=9b60884026404a58a8d19d787ef3ffaa612488f601cbf72d7b5d6520b5c9a172&w=740',
                              ),
                              fit: BoxFit.cover,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(2.5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      'Chest Dips',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '3 Sets',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  Divider(),
                  SizedBox(
                    height: height * .05,
                  ),

                  Align(
                    alignment: Alignment.center,
                    child:
                    Text(
                      '4 minutes of rest',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(

                          activeColor: Colors.green,
                          value: value2, onChanged: (_){
                        setState(() {
                          if (_ == false)
                          {
                            value2 = false;
                          }
                          else
                          {
                            value2 = true;
                            _playAudio();

                          }
                        });
                      }),
                    ],
                  ),
                  SizedBox(
                    height: height * .0125,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: height * .2,
                          width: width * .45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://img.freepik.com/free-photo/handsome-training-equipment-sport-gym_1150-12354.jpg?t=st=1732751218~exp=1732754818~hmac=d3f683e89410e047382e16e4be64beff8181d2cef8a5ab82abdf5127202a2904&w=900',
                                ),
                                fit: BoxFit.cover,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2.5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        'Lat Pull Down',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '3 Sets',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )),
                      Container(
                          height: height * .2,
                          width: width * .45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://img.freepik.com/free-photo/training-cross-fit_169016-2194.jpg?t=st=1732750605~exp=1732754205~hmac=22147260257e4a038a6d5d96b04c255c8254d5ba2630c0a9bb63d5c64ed2d8db&w=360',
                                ),
                                fit: BoxFit.cover,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2.5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        'Pull Ups',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '4 Sets',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Align(
                    alignment: Alignment.center,

                    child: Container(
                        height: height * .2,
                        width: width * .45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://img.freepik.com/free-photo/outdoors-training-pullups-exercise_23-2148284772.jpg?t=st=1732751896~exp=1732755496~hmac=f0e227c5a432d1bc977004035e9d70629fce29e630b2c2c18513a4949dcb1608&w=740',
                              ),
                              fit: BoxFit.cover,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(2.5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      'Lat Pull Down Close Grip',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '3 Sets',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
