import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ls/Core/Constant/Loading%20Indicator/Loading%20indecator.dart';
import 'package:ls/Featrue/MainLayout/view/Courses%20Feature/View%20Model/courses_cubit.dart';
import 'package:ls/Featrue/MainLayout/view/Courses%20Feature/View/Course%20Video%20Screen/View/Course%20Video%20Screen.dart';
import 'package:uni_links/uni_links.dart';

class SpecificCourse extends StatefulWidget {
   bool isEnrolled;
  final String courseId;

   SpecificCourse(
      {super.key, required this.courseId, required this.isEnrolled});

  @override
  State<SpecificCourse> createState() => _SpecificCourseState();
}

class _SpecificCourseState extends State<SpecificCourse> {

  StreamSubscription? sub;

  void _initDeepLinkListener() async {
    print('initDeepLinkListener');
    sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        uri.pathSegments.contains('complete') ? 'Payment Complete' : 'Payment Canceled';
        if (uri.pathSegments.contains('complete')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Payment Complete'),
            ),
          );
          String? token = RegExp(r'token=([^&]+)')
              .firstMatch(CoursesCubit.get(context).buyCourseModel!.approvalUrl)
              ?.group(1);
          print('token =>>>>>>>>>>>>>>>>>>>> $token');
          CoursesCubit.get(context).CapturePaymentForLessonScreen(token:token!, Id: widget.courseId, isEnrolled: widget.isEnrolled ,  );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Payment Canceled'),
            ),
          );
        }
      }
    }, onError: (err) {
      print(err);

    });
  }
  @override
  void initState() {
    _initDeepLinkListener();
    super.initState();
    if (widget.isEnrolled == true){
      CoursesCubit.get(context).getSpecificCoursesLesson(id: widget.courseId);

    }
  }
  
 
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Course',
            style: TextStyle(
                color: Colors.black,
                fontSize: width * .05,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Iconsax.arrow_left_2,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: widget.isEnrolled == true
            ? BlocConsumer<CoursesCubit, CoursesState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return CoursesCubit.get(context).specificCourseLessonModel !=
                          null
                      ? CoursesCubit.get(context)
                              .specificCourseLessonModel!
                              .data!
                              .isNotEmpty
                          ? Column(
                              children: [
                                Container(
                                  width: width,
                                  margin: EdgeInsets.all(12),
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.deepPurple.withOpacity(.7),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      Text(
                                        CoursesCubit.get(context)
                                            .specificCourseLessonModel!
                                            .data![0]
                                            .course!
                                            .title!,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * .055,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${CoursesCubit.get(context).specificCourseLessonModel!.data!.length.toString()} Lessons',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * .03,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      Text(
                                        CoursesCubit.get(context)
                                            .specificCourseLessonModel!
                                            .data![0]
                                            .type!,
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: width * .04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * .01,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Lessons',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: width * .04,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Videos',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: CoursesCubit.get(context)
                                          .specificCourseLessonModel!
                                          .data!
                                          .length,
                                      itemBuilder: (context, index) => Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10),
                                                padding: EdgeInsets.all(15),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                child: Center(
                                                  child: Text(
                                                    '${index + 1}',
                                                    style: TextStyle(
                                                        color: Colors.black26,
                                                        fontSize: width * .04,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * .3,
                                                child: Text(
                                                  CoursesCubit.get(context)
                                                      .specificCourseLessonModel!
                                                      .data![index]
                                                      .title!,
                                                  style: TextStyle(
                                                      color: Colors.black87
                                                          .withOpacity(.8),
                                                      fontSize: width * .04,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () async {
                                                  print(CoursesCubit.get(
                                                          context)
                                                      .specificCourseLessonModel!
                                                      .data![index]
                                                      .video!
                                                      .thumbnail!);
                                                  CoursesCubit.get(context)
                                                      .getSpecificLesson(
                                                          id: CoursesCubit.get(
                                                                  context)
                                                              .specificCourseLessonModel!
                                                              .data![index]
                                                              .id!);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            CourseVideoScreen(),
                                                      ));
                                                },
                                                child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 30,
                                                            vertical: 10),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 12),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: Colors
                                                                .deepPurple)),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Iconsax.play,
                                                          color: Colors
                                                              .deepPurpleAccent,
                                                          size: width * .04,
                                                        ),
                                                        Text(
                                                          ' Play Video',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .deepPurpleAccent,
                                                              fontSize:
                                                                  width * .03),
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Colors.black54,
                                            endIndent: height * .025,
                                            indent: height * .025,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          : Center(
                              child: Text(
                                  'No Lessons Available for this course')
                  )
                      : Center(
                        child: MyLoadingIndicator(
                            height: height * .3, color: Colors.deepPurple),
                      );
                },
              )
            : Center(
                child: Container(
                  height: height * .2,
                  width: width * .85,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'You are not enrolled in this course',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: width * .04,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Colors.deepPurpleAccent)),
                          onPressed: () {
                            CoursesCubit.get(context).buyCourse(
                                ID: widget.courseId, context: context);
                          },
                          //9KA80247WN3486405
                          child: Text(
                            'Enroll Now',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
