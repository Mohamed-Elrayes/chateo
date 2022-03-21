part of 'messaging_bloc.dart';

abstract class MessagingEvent extends Equatable {
  const MessagingEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends MessagingEvent {
  const SendMessageEvent(
   { required this.message,}
  );
  final String message;
  @override
  List<Object> get props => [message];
}

class ReservedMessageEvent extends MessagingEvent {
  const ReservedMessageEvent(
      this.messages,
      );
  final List<MessageModel> messages;
  @override
  List<Object> get props => [messages];
}

