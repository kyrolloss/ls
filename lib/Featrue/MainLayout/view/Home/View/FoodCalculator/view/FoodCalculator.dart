import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:ls/Featrue/MainLayout/view/Home/View/FoodCalculator/view/FoodCalculatorFilter/View/FoodCalculatorFilter.dart';
import 'package:number_paginator/number_paginator.dart';
import '../view_Model/food_calculator_cubit.dart';
import 'FoodCalculatorDetails/view/FoodCalulatorDetails.dart';
import 'FoodCalculatorDetails/viewmodel/food_calculator_Details_cubit.dart';

class FoodCalculator extends StatefulWidget {
  final String mealCategory;

  const FoodCalculator({super.key, required this.mealCategory});

  @override
  State<FoodCalculator> createState() => _FoodCalculatorState();
}

class _FoodCalculatorState extends State<FoodCalculator> {
  late TextEditingController _searchController;
  late NumberPaginatorController _controller;

  List<String> nutrientsList = [
    "calories",
    "proteins",
    "carbohydrates",
    "fats",
    "fibers",
    "sugar",
    "VitaminA",
    "VitaminB1",
    "VitaminB2"
  ];

  List<String> imageList = [
    'calories.png',
    'protein.png',
    'carb.png',
    'fats.png',
    'fiber.png',
    'dl.beatsnoop.com-high-3033d91e97a3b91c0a-removebg-preview.png',
    'vitamin-a.png',
    'vitamin-b.png',
    'vitamin-b.png',
  ];

  @override
  void initState() {
    super.initState();
    _controller = NumberPaginatorController();
    _searchController = TextEditingController();
    context
        .read<FoodCalculatorCubit>()
        .getFoodCalculator(mealCategory: widget.mealCategory);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _performSearch() {
    final query = _searchController.text;
    context.read<FoodCalculatorCubit>().searchFoodCalculator(query: query);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Food Calculator',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 4.0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search, color: kThirdColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onSubmitted: (value) => _performSearch(),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.filter_list, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodCalculatorFilter()));
                  },
                ),
              ],
            ),
          ),
          BlocBuilder<FoodCalculatorCubit, FoodCalculatorState>(
            builder: (context, state) {
              final cubit = FoodCalculatorCubit.get(context);
              final numberOfPages =
                  cubit.foodCalculatorModel?.paginationResult.numberOfPages ??
                      0;

              if (numberOfPages > 0) {
                return NumberPaginator(
                  controller: _controller,
                  numberPages: numberOfPages,
                  onPageChange: (int index) {
                    cubit.getFoodCalculator(page: index + 1);
                  },
                );
              }
              return const SizedBox();
            },
          ),
          Expanded(
            child: BlocConsumer<FoodCalculatorCubit, FoodCalculatorState>(
              listener: (context, state) {
                if (state is FoodCalculatorError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Error Loading')),
                  );
                }
              },
              builder: (context, state) {
                if (state is FoodCalculatorLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: kSecondColor),
                  );
                } else if (state is FoodCalculatorSuccess) {
                  final foodCalculatorModel = state.foodCalculatorModel;

                  if (foodCalculatorModel.data.isEmpty) {
                    return const Center(
                      child: Text(
                        'No Data To Show',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: foodCalculatorModel.data.length,
                    itemBuilder: (context, index) {
                      final foodItem = foodCalculatorModel.data[index];
                      final foodId = foodItem.id;

                      List<String> foodDetails = [
                        '${foodItem.Calories} c',
                        '${foodItem.Protein ?? 0} g',
                        '${foodItem.Carbohydrates ?? 0} g',
                        '${foodItem.Fats ?? 0} g',
                        '${foodItem.Fiber ?? 0} g',
                        '${foodItem.Sugar ?? 0} g',
                        '${foodItem.VitaminA ?? 0} g',
                        '${foodItem.VitaminB1 ?? 0} g',
                        '${foodItem.VitaminB2 ?? 0} g',
                      ];

                      return GestureDetector(
                        onTap: () {
                          FoodCalculatorDetailsCubit.get(context).fetchFoodCalculatorDetails(
                            mealId: foodId,
                            quantities: '100',
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodCalculatorDetails(id: foodId),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0), // تقليل الهوامش الخارجية
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white, width: width * 0.005), // تقليل عرض الحدود
                          ),
                          elevation: 4.0, // تقليل الظل
                          child: Padding(
                            padding: const EdgeInsets.all(10.0), // تقليل الهوامش الداخلية
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  foodItem.image,
                                  width: width * 0.9, // تقليل عرض الصورة
                                  height: height * 0.3, // تقليل ارتفاع الصورة
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 8), // تقليل المسافة بين العناصر
                                Text(
                                  foodItem.TitleEN,
                                  maxLines: 2, // تقليل عدد السطور للنص
                                  style: const TextStyle(
                                    fontSize: 18, // تقليل حجم النص
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: height * 0.4, // تقليل ارتفاع الشبكة
                                  child: GridView.builder(
                                    physics: const NeverScrollableScrollPhysics(), // تعطيل التمرير داخل الشبكة
                                    shrinkWrap: true, // تقليل حجم الشبكة بما يتناسب مع المحتوى
                                    itemCount: nutrientsList.length,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 1.2, // تحسين نسبة العرض إلى الارتفاع
                                      crossAxisSpacing: 8, // تقليل المسافات بين الأعمدة
                                      mainAxisSpacing: 8, // تقليل المسافات بين الصفوف
                                    ),
                                    itemBuilder: (context, index) => Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8), // تقليل الزوايا
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            'assets/images/${imageList[index]}',
                                            height: 25, // تقليل حجم الأيقونات
                                          ),
                                          Text(
                                            nutrientsList[index],
                                            style: const TextStyle(
                                              fontSize: 12, // تقليل حجم النص
                                              fontWeight: FontWeight.bold,
                                              color: kThirdColor,
                                            ),
                                          ),
                                          Text(
                                            foodDetails[index],
                                            style: const TextStyle(
                                              fontSize: 12, // تقليل حجم النص
                                              fontWeight: FontWeight.bold,
                                              color: kThirdColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );

                    },
                  );
                } else {
                  return const Center(child: Text('Error Loading'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
