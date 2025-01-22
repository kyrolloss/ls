import 'package:flutter/material.dart';
import 'package:ls/Featrue/MainLayout/view/Courses%20Feature/View/Course%20Video%20Screen/Model/Specific%20Model.dart';

import '../../../../../../Auth Feature/login/view_mode/login_cubit.dart';
import '../../../Model/Courses Model/Courses Model.dart';
import '../../../View Model/courses_cubit.dart';
import '../../Specific Course/View/Specific Course.dart';
import '../Courses Details Dialog/Courses Details Dialog.dart';

class CourseWidget extends StatelessWidget {
  final Courses course;
  final double screenWidth;
  final double screenHeight;
  final bool isEnrolled;

  const CourseWidget(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.course,
      required this.isEnrolled});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isEnrolled) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SpecificCourse(
                courseId: course.id.toString(),
                isEnrolled: isEnrolled,
              ),
            ),
          );
        } else {
          CoursesCubit.get(context)
              .getSpecificCoursesLesson(id: course.id.toString());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SpecificCourse(
                courseId: course.id.toString(),
                isEnrolled: isEnrolled,
              ),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
            ),
          ],
        ),
        child: SizedBox(
          width: screenWidth * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  course.image ?? 'https://via.placeholder.com/200',
                  height: screenHeight * 0.135,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.425,
                      height: screenHeight * 0.02,
                      child: Text(
                        course.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(
                          width: screenWidth * .12,
                          child: Text(
                            'Price: ',
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * .25,
                          child: Text(
                            '${course.price ?? 0}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: screenWidth * 0.035,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: screenWidth * .2,
                          child: Text(
                            'Price After Discount: ',
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * .2,
                          child: Text(
                            '${course.priceAfterDiscount ?? 0}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.5),
              isEnrolled
                  ? SizedBox()
                  : Center(
                      child: ElevatedButton(
                          onPressed: () {
                            CoursesCubit.get(context).buyCourse(
                                ID: course.id.toString(), context: context);
                          },
                          child: Text(
                            'Enroll Now',
                          )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
