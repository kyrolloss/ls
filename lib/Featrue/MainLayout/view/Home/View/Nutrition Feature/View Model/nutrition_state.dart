part of 'nutrition_cubit.dart';

@immutable
sealed class NutritionState {}

final class NutritionInitial extends NutritionState {

}
final class GetImageNutritionLoading extends NutritionState {}
final class GetImageNutritionSuccess extends NutritionState {}
final class GetImageNutritionError extends NutritionState {}


final class GetImageFromGalleryLoading extends NutritionState {}
