part of 'food_calculator_cubit.dart';

@immutable
abstract class FoodCalculatorState {}

class FoodCalculatorInitial extends FoodCalculatorState {}
class FoodCalculatorSuccess extends FoodCalculatorState{
  final FoodCalculatorModel foodCalculatorModel;
  FoodCalculatorSuccess(this.foodCalculatorModel);
}
class FoodCalculatorError extends FoodCalculatorState{}
class FoodCalculatorLoading extends FoodCalculatorState{}
class ChangePageFoodState extends FoodCalculatorState{}
