part of 'trips_list_cubit.dart';

@immutable
sealed class TripsListState {}

final class TripsListInitial extends TripsListState {}
final class TripsListLoaded extends TripsListState {}
final class TripsListFaliure extends TripsListState {
  final String errorMessage;
  TripsListFaliure({required this.errorMessage});
}
final class TripsListSuccess extends TripsListState {
  final List<TripModel> trips;

  TripsListSuccess({required this.trips});

}



final class TripsPrice extends TripsListState {
  final double price;

  TripsPrice({required this.price});

}


