part of 'driver_register_cubit.dart';

@immutable
sealed class DriverRegisterState {}

final class DriverRegisterInitial extends DriverRegisterState {}
final class DriverRegisterLoading extends DriverRegisterState {}
final class DriverRegisterSuccess extends DriverRegisterState {}
final class DriverRegisterFailure extends DriverRegisterState {
  final String errorMessage;
  DriverRegisterFailure(this.errorMessage);
}


