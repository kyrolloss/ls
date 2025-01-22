part of 'supplements_cubit.dart';

@immutable
sealed class SupplementsState {}

final class SupplementsInitial extends SupplementsState {}

final class SetSupplements extends SupplementsState {}

final class UpdateSupplementsTime extends SupplementsState {}

final class GetSupplementsDataState extends SupplementsState {}

final class SetSupplementsDataState extends SupplementsState {}

final class SetSupplementsAlarm extends SupplementsState {}

final class InitializeSupplements extends SupplementsState {}
final class UpdateStatus extends SupplementsState {}
