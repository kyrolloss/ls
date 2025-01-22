import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

import '../viewmodel/food_calculator_Details_cubit.dart';

class FoodCalculatorDetails extends StatefulWidget {
  final String id;

  const FoodCalculatorDetails({super.key, required this.id});

  @override
  State<FoodCalculatorDetails> createState() => _FoodCalculatorDetailsState();
}

class _FoodCalculatorDetailsState extends State<FoodCalculatorDetails> {
  late TextEditingController _quantityController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _quantityController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  List<String> nutrientsList = [
    "calories",
    "proteins",
    "carbohydrates",
    "fats",
    "fibers",
    "sugar",
    "VitaminA",
    "VitaminB1",
    "VitaminB2",
    "VitaminB3",
    "VitaminB5",
    "VitaminB6",
    "VitaminB7",
    "VitaminB9",
    "VitaminB12",
    "VitaminC",
    "VitaminD",
    "VitaminE",
    "VitaminK",
    "calcium",
    "iron",
    "magnesium",
    "potassium",
    "sodium",
    "zinc",
    "copper",
    "manganese",
    "selenium"
  ];
  List<String> imageList = [
    'calories.png',
    'protein.png',
    'carb.png',
    'fats.png',
    'fiber.png',
    'assets/images/dl.beatsnoop.com-high-3033d91e97a3b91c0a-removebg-preview.png',
    'vitamin-a.png',
    'vitamin-b.png',
    'vitamin-b.png',
    'vitamin-b.png',
    'vitamin-b.png',
    'vitamin-b.png',
    'vitamin-b.png',
    'vitamin-b.png',
    'vitamin-b.png',
    'vitamin-c.png',
    'vitamin-d.png',
    'vitamin-e.png',
    'Vitamin K.png',
    'calcium.png',
    'iron.png',
    'magnesium.png',
    'potassium.png',
    'sodium.png',
    'zinc.png',
    'copper.png',
    'manganese.png',
    'selenium.png'
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'Food Calculator Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:
          BlocConsumer<FoodCalculatorDetailsCubit, FoodCalculatorDetailsState>(
              listener: (context, state) {
        if (state is FoodCalculatorDetailsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error loading details')),
          );
        }
      }, builder: (context, state) {
        if (state is FoodCalculatorDetailsLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: kSecondColor,
          ));
        }
        final calculationData = FoodCalculatorDetailsCubit.get(context)
            .foodCalculatorDetails!
            .data
            .calculationData;
        List<String> nutrients = [
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Calories.toString()} c',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Protein.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Carbohydrates.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Fats.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Fiber.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Sugar.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.VitaminA.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.VitaminB1.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.VitaminB2.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.VitaminB3.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.VitaminB5.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.VitaminB6.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.VitaminB7.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.VitaminB9.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.VitaminB12.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.VitaminC.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.VitaminD.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.VitaminE.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.VitaminK.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Calcium.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Iron.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Magnesium.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Potassium.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Sodium.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Zinc.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Copper.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Manganese.toString()} g',
          '${FoodCalculatorDetailsCubit.get(context).foodCalculatorDetails!.data.calculationData.Selenium.toString()} g',
        ];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Enter the quantity in grams',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.deepPurpleAccent,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(18.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kSecondColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(18.0),
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: 'Quantity (grams)',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(18.0),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a quantity';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.deepPurpleAccent),
                      textStyle: WidgetStateProperty.all(const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<FoodCalculatorDetailsCubit>()
                            .fetchFoodCalculatorDetails(
                              mealId: widget.id,
                              quantities: _quantityController.text,
                            );
                      }
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 20),
                  if (calculationData != null) ...[
                    GridView.builder(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.manual,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 28,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .75,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(),
                            Image.asset(
                              'assets/images/${imageList[index]}',
                              height: 55,
                            ),
                            Text(
                              nutrientsList[index],
                              style: TextStyle(
                                fontSize: width * .05,
                                fontWeight: FontWeight.bold,
                                color: kThirdColor,
                              ),
                            ),
                            Text(
                              nutrients[index],
                              style: TextStyle(
                                fontSize: width * .05,
                                fontWeight: FontWeight.bold,
                                color: kThirdColor,
                              ),
                            ),
                            SizedBox()
                          ],
                        ),
                      ),
                    )
                  ] else ...[
                    const Center(
                        child: Text('No Data Available',
                            style: TextStyle(color: Colors.black))),
                  ],
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildNutrientRow(String label, num value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          Text(
            '$value g',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
