part of 'vitamin_cubit.dart';

@immutable
sealed class VitaminScreenState {}

final class VitaminInitial extends VitaminScreenState {}


final class GetVitaminLoading extends VitaminScreenState {}
final class GetVitaminSuccess extends VitaminScreenState {}
final class GetVitaminError extends VitaminScreenState {}


final class GetSupplementsLoading extends VitaminScreenState {}
final class GetSupplementsSuccess extends VitaminScreenState {}
final class GetSupplementsError extends VitaminScreenState {}
