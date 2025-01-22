import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ls/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:ls/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/Profile/view_model/profile_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import '../../Settings/view/Settings.dart';
import '../View Model/home_cubit.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'Nutrition Feature/View/Nutrition View.dart';
import 'Progress Feature/View Model/progress_cubit.dart';
import 'Progress Feature/View/Progress Screen/Progress Screen.dart';
import 'Today Workout/View/Today WorkOutView.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> images = [
    "https://img.freepik.com/free-photo/front-view-athletic-male-rugby-player-holding-ball-with-dust_23-2148793373.jpg?t=st=1732684952~exp=1732688552~hmac=3f80551b1d835c79b0af96c4b8ac781c57c49b17f5280c785f4c3ced627d93a1&w=360",
    "https://img.freepik.com/free-photo/athletic-shaved-head-tattooed-male-doing-shoulder-workout-with-dumbbell_613910-14208.jpg?t=st=1732685109~exp=1732688709~hmac=6a1719e3ed25181b4d7b1887f17c1f6f502e1f84347315205b043648baef78b0&w=360",
    "https://img.freepik.com/free-photo/side-view-muscly-athletic-man-holding-weights_23-2148418211.jpg?t=st=1732685125~exp=1732688725~hmac=236ca7ddabe6d66698911f103a17af19a2aad309c81cb4d2791e3e642ee37e58&w=360",
    "https://img.freepik.com/free-photo/shirtless-muscular-man-with-barbell-sits-black-chair_613910-1852.jpg?t=st=1732685156~exp=1732688756~hmac=787880e69acf95fa9b45c300104222f01f2e66993c2b89968587cdd39f30d246&w=360"
  ];
  List<String> plan = [
    "WorkOut",
    "Diet & Meals",
    "Vitamine",
    "Other",
  ];
  List<String> number = [
    "13 Exercises",
    "4 Meals",
    "6 Vitamins",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => HomeCubit()..getAdvertise(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: height * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/home background.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.dstIn,
                        child: Container(
                          color: Colors.black87.withOpacity(.8),
                        ),
                      ),
                    ),
                    Positioned(
                      left: width * .02,
                      top: height * .01,
                      child: Row(
                        children: [
                          Text(
                            S.of(context).home_Hey,
                            style: GoogleFonts.bebasNeue(
                              fontSize: width * 0.08,
                              color: Colors.white,
                              letterSpacing: 1.8,
                            ),
                          ),
                          BlocConsumer<ProfileCubit, ProfileState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              return Text(
                                ProfileCubit.get(context)
                                        .profileModel
                                        ?.data
                                        .username ??
                                    '',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: width * 0.08,
                                  color: Colors.white,
                                  letterSpacing: 1.8,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        right: width * .2,
                        left: width * .2,
                        top: height * .135,
                        child: CircleAvatar(
                          radius: width * .075,
                          backgroundColor: kSecondColor,
                          child: Center(
                            child: Icon(
                              Icons.play_arrow,
                              size: width * 0.1,
                              color: Colors.white,
                            ),
                          ),
                        )),
                    Positioned(
                        right: width * .065,
                        top: height * .015,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingsPage(),
                                ));
                          },
                          child: Icon(
                            Iconsax.setting_25,
                            color: Colors.white,
                            size: width * .075,
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).home_Today_Plan,
                        style: GoogleFonts.lato(
                          fontSize: width * 0.055,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        S.of(context).home_See_more,
                        style: GoogleFonts.lato(
                            fontSize: width * 0.03,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .25,
                  width: width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TodayWorkOutView(),
                                  ));
                            },
                            child: Container(
                                height: height * .25,
                                width: width * .425,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        images[index],
                                      ),
                                      fit: BoxFit.cover,
                                      opacity: .5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.05,
                                    vertical: height * 0.01),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        plan[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        number[index],
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, left: width * 0.05),
                  child: Text(
                    "${S.of(context).home_Discover} ",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                      fontSize: width * 0.07,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return SizedBox(
                      height: height * .25,
                      width: width,
                      child: HomeCubit.get(context).advertiseModel != null
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: HomeCubit.get(context)
                                  .advertiseModel!
                                  .data
                                  .length,
                              itemBuilder: (context, index) {
                                DateTime dateTime = DateTime.parse(
                                    HomeCubit.get(context)
                                        .advertiseModel!
                                        .data[index]
                                        .createdAt);
                                String timeAgo = timeago.format(dateTime);

                                return GestureDetector(
                                  onTap: () {
                                    HomeCubit.get(context).useAdvertiseFunction(
                                      title: HomeCubit.get(context)
                                          .advertiseModel!
                                          .data[index]
                                          .targetModel,
                                      id: HomeCubit.get(context)
                                          .advertiseModel!
                                          .data[index]
                                          .targetModelId,
                                      context: context,
                                      index: index,
                                    );
                                  },
                                  child: Container(
                                      height: height * .25,
                                      width: width * .425,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              HomeCubit.get(context)
                                                  .advertiseModel!
                                                  .data[index]
                                                  .image,
                                            ),
                                            fit: BoxFit.cover,
                                            opacity: .5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: width * 0.05,
                                          vertical: height * 0.01),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              HomeCubit.get(context)
                                                  .advertiseModel!
                                                  .data[index]
                                                  .title,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.04,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              timeAgo,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                );
                              })
                          : Center(
                              child: MyLoadingIndicator(
                                  height: height * .3, color: kSecondColor),
                            ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, left: width * 0.05),
                  child: Row(
                    children: [
                      Text(
                        "${S.of(context).home_Your} ",
                        style: GoogleFonts.lato(
                          fontSize: width * 0.07,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        S.of(context).home_Progress,
                        style: GoogleFonts.lato(
                          fontSize: width * 0.08,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                GestureDetector(
                  onTap: () async {
                    await ExerciseCubit.get(context).getExercise(page: 1);
                    //  ProgressCubit.get(context).getExercisesProgress(
                    //     id: ExerciseCubit.get(context)
                    //         .exercisesModel!
                    //         .data[0]
                    //         .id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProgressScreen()),
                    );
                  },
                  child: Image(
                    image: AssetImage('assets/images/Progress.jpg'),
                    width: width * 0.9,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
