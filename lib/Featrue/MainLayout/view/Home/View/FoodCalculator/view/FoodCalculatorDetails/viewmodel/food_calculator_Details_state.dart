part of 'food_calculator_Details_cubit.dart';

@immutable
abstract class FoodCalculatorDetailsState {}

class FoodCalculatorInitial extends FoodCalculatorDetailsState {}

class FoodCalculatorDetailsLoading extends FoodCalculatorDetailsState {}

class FoodCalculatorDetailsSuccess extends FoodCalculatorDetailsState {
  final FoodCalculatorDetailsModel foodDetails;

  FoodCalculatorDetailsSuccess({required this.foodDetails});
}

class FoodCalculatorDetailsError extends FoodCalculatorDetailsState {}
