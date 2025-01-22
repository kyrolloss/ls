import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ls/Featrue/MainLayout/view/Home/View/FoodCalculator/view/FoodCalculator.dart';
import 'package:ls/Featrue/MainLayout/view/Home/View/FoodCalculator/view/FoodCalculatorFilter/ViewModel/food_calculator_filter_cubit.dart';

class FoodCalculatorFilter extends StatefulWidget {
  const FoodCalculatorFilter({super.key});

  @override
  State<FoodCalculatorFilter> createState() => _FoodCalculatorFilterState();
}

class _FoodCalculatorFilterState extends State<FoodCalculatorFilter> {
  @override
  void initState() {
    super.initState();
    FoodCalculatorFilterCubit.get(context).FoodCalculatorCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Calculator Filter'),
      ),
      body: BlocBuilder<FoodCalculatorFilterCubit, FoodCalculatorFilterState>(
        builder: (context, state) {
          if (state is FoodCalculatorFilterLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FoodCalculatorFilterError) {
            return const Center(child: Text('Error loading categories'));
          }

          if (state is FoodCalculatorFilterSuccess) {
            final categories = context.read<FoodCalculatorFilterCubit>().foodCalculatorFilterModel?.data ?? [];

            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return ListTile(
                  title: Text(category.TitleEN, style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // التمرير إلى صفحة FoodCalculator مع الفئة المختارة
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodCalculator(mealCategory: category.id), // تمرير الفئة
                      ),
                    );
                  },
                );
              },
            );
          }

          return const Center(child: Text('No categories found'));
        },
      ),
    );
  }
}
