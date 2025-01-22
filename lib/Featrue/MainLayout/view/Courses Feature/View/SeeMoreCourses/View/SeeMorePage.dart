import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ViewModel/more_courses_cubit.dart';

class SeeMoreCourses extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  const SeeMoreCourses({super.key, required this.categoryId, required this.categoryName});

  @override
  State<SeeMoreCourses> createState() => _SeeMoreCoursesState();
}

class _SeeMoreCoursesState extends State<SeeMoreCourses> {
  @override
  void initState() {
    super.initState();
    MoreCoursesCubit.get(context).SeeMoreCourses(ID: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = MoreCoursesCubit.get(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.categoryName,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BlocConsumer<MoreCoursesCubit, MoreCoursesState>(
        listener: (context, state) {
          if (state is SeeMoreCoursesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error During Loading Data")),
            );
          }
        },
        builder: (context, _) {
          final courses = cubit.seeMoreCourses?.data ?? [];

          if (courses.isEmpty) {
            return const Center(
              child: Text(
                "No Available Courses Right Now",
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              final imageSize = screenWidth * 0.2; // حجم الصورة يعتمد على عرض الشاشة

              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      if (course.image != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            course.image!,
                            height: screenHeight*.1,
                            width: screenWidth*0.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.title ?? "No Name",
                              style: TextStyle(
                                fontSize: screenWidth * 0.04, // النص يصبح ديناميكي
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              course.description ?? "No Description",
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Colors.grey,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price: ${course.price}",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Discount: ${course.priceAfterDiscount}",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
