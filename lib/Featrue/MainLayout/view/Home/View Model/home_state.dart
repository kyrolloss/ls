part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class GetAdvertiseLoading  extends HomeState {}
final class GetAdvertiseSuccess  extends HomeState {}
final class GetAdvertiseFailed  extends HomeState {}

final class UseAdvertiseFunctionLoading  extends HomeState {}
final class UseAdvertiseFunctionSuccess  extends HomeState {}
final class UseAdvertiseFunctionFailed  extends HomeState {}
