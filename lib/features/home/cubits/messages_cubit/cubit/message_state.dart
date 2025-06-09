part of 'message_cubit.dart';

@immutable
sealed class MessageState {}

final class MessageInitial extends MessageState {}

final class MessageLoading extends MessageState {}

final class MessageLoaded extends MessageState {
  final List<MessageModel> messages;

  MessageLoaded({required this.messages});
}

final class MessageError extends MessageState {
  final String error;

  MessageError({required this.error});
}

final class MessageAllDriverLoading extends MessageState {}

final class MessageAllDriverFaluire extends MessageState {
  final String erroeMessages;
  MessageAllDriverFaluire({required this.erroeMessages});
}
final class MessageAllDriverSuccess extends MessageState {
  final List<String> allDrivermessages;
  MessageAllDriverSuccess({required this.allDrivermessages});
}


final class MessageAllClientLoading extends MessageState {}

final class MessageAllClientFaluire extends MessageState {
  final String erroeMessages;
  MessageAllClientFaluire({required this.erroeMessages});
}
final class MessageAllClientSuccess extends MessageState {
  final List<String> allClientmessages;
  MessageAllClientSuccess({required this.allClientmessages});
}


