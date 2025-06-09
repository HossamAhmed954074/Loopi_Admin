part of 'clint_list_cubit.dart';

@immutable
sealed class ClintListState {}

final class ClintListInitial extends ClintListState {}
final class ClintListLoading extends ClintListState {}
final class ClintLisSuccess extends ClintListState {
  final List<ClientModel> clients;

  ClintLisSuccess(this.clients);
}
final class ClintListFaluire extends ClintListState {
  final String errorMessage;

  ClintListFaluire(this.errorMessage);
}

