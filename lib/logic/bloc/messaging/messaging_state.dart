part of 'messaging_bloc.dart';

enum MessageStatus { success, failed, initial }

class MessagingState extends Equatable {
  final List<MessageModel> messagesList;
  final MessageStatus messageStatus;
  const MessagingState({
    this.messagesList = const [],
    this.messageStatus = MessageStatus.initial,
  });
  @override
  List<Object> get props => [messagesList,messageStatus];

  MessagingState copyWith({
    List<MessageModel>? messagesList,
    MessageStatus? messageStatus,
  }) {
    return MessagingState(
      messagesList: messagesList ?? this.messagesList,
      messageStatus: messageStatus ?? this.messageStatus,
    );
  }
}
