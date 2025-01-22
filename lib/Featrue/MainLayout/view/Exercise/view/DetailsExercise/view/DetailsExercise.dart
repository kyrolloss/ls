import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Featrue/MainLayout/view/Exercise/view/DetailsExercise/View%20Model/exercises_details_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/widget/Progress%20Widget/Progress%20Widget.dart';
import 'package:ls/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/widget/Video%20Widget/videowidget.dart';
import 'package:video_player/video_player.dart';
import 'package:ls/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

class ExercisePage extends StatefulWidget {
  final String ID;

  // final String videoPath;

  ExercisePage({required this.ID});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  String selectedTab = 'Progress';

  @override
  void initState() {
    super.initState();

    ExercisesDetailsCubit.get(context).getExercisesDetails(
        id: widget.ID, context: context, isAdvertise: false).then((_){

    });


  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return BlocConsumer<ExercisesDetailsCubit, ExercisesDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ExercisesDetailsCubit.get(context).exerciseDetailsModel == null
            ? Scaffold(
                backgroundColor: kThirdColor,
                body: Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: kThirdColor,
                  title: Text(
                    ExercisesDetailsCubit.get(context)
                            .exerciseDetailsModel
                            ?.data
                            .title ??
                        '',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  centerTitle: true,
                ),
                backgroundColor: kThirdColor,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey[200],
                            ),
                            child: SizedBox(
                                height: height * .2,
                                width: width,
                                child: VideoWidget(
                                  id: ExercisesDetailsCubit.get(context)
                                      .exerciseDetailsModel!
                                      .data
                                      .video
                                      .url,
                                ))),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildTabButton(
                                  'Progress', selectedTab == 'Progress'),
                              _buildTabButton(
                                  'Muscle', selectedTab == 'Muscle'),
                              _buildTabButton(
                                  'How to do', selectedTab == 'How to do'),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildContent(),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),

              );
      },
    );
  }

  Widget _buildTabButton(String text, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = text;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? kSecondColor : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : kThirdColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (selectedTab == 'Progress') {
      return ProgressWidget(
        id: ExercisesDetailsCubit.get(context).exerciseDetailsModel!.data.id,
      );
    } else if (selectedTab == 'Muscle') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'REPEATS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kSecondColor,
                ),
              ),
              Text(
                'x12',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Sets',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kSecondColor,
                ),
              ),
              Text(
                'x3',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'INSTRUCTIONS',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kSecondColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Start in the regular push-up position but with your hands spread wider than your shoulders.\n\n'
            'Then push your body up and down. Remember to keep your body straight.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'FOCUS AREA',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kSecondColor,
            ),
          ),
          SizedBox(height: 10),
        ],
      );
    } else if (selectedTab == 'How to do') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How to do content: Step by step instructions.',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      );
    }
    return Container();
  }
}
