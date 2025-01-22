part of 'food_calculator_filter_cubit.dart';

@immutable
abstract class FoodCalculatorFilterState {}

class FoodCalculatorFilterInitial extends FoodCalculatorFilterState {}

class FoodCalculatorFilterSuccess extends FoodCalculatorFilterState{}
class FoodCalculatorFilterLoading extends FoodCalculatorFilterState{}
class FoodCalculatorFilterError extends FoodCalculatorFilterState{}
