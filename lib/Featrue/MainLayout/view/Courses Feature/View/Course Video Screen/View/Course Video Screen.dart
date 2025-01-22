import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ls/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:ls/Featrue/MainLayout/view/Courses%20Feature/View%20Model/courses_cubit.dart';

import '../../../../Exercise/view/DetailsExercise/view/widget/Video Widget/videowidget.dart';

class CourseVideoScreen extends StatefulWidget {
  const CourseVideoScreen({super.key});

  @override
  State<CourseVideoScreen> createState() => _CourseVideoScreenState();
}

class _CourseVideoScreenState extends State<CourseVideoScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CoursesCubit, CoursesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return CoursesCubit.get(context).specificLesson != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 200,
                        child: VideoWidget(
                          id: CoursesCubit.get(context)
                              .specificLesson!
                              .data!
                              .video!
                              .publicId
                              .toString(),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: width * .4,
                          height: height * .05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.deepPurpleAccent)),
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * .04),
                            ),
                          ),
                        ),
                        Container(
                          width: width * .4,
                          height: height * .05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.deepPurpleAccent)),
                          child: Center(
                            child: Text(
                              'Previous',
                              style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * .04),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(
                          CoursesCubit.get(context).specificLesson!.data!.title!,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: width * .05),
                        ),
                        SizedBox(
                          height: 7.5,
                        ),
                        Text(
                          CoursesCubit.get(context).specificLesson!.data!.createdAt!,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: width * .035,
                            color: Colors.grey
                          ),
                        ),

                      ]),
                    )
                  ],
                )
              : Center(
                  child: MyLoadingIndicator(
                      height: height * .4, color: Colors.deepPurple),
                );
        },
      ),
    );
  }
}
