part of 'drivers_list_cubit.dart';

@immutable
sealed class DriversListState {}

final class DriversListInitial extends DriversListState {}
final class DriversListLoading extends DriversListState {}
final class DriversLisSuccess extends DriversListState {
  final List<DriverModel> drivers;

  DriversLisSuccess(this.drivers);
}
final class DriversListFaluire extends DriversListState {
  final String errorMessage;

  DriversListFaluire(this.errorMessage);
}
