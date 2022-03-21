import 'dart:async';

import 'package:chateo/core/constants/api_constant.dart';
import 'package:chateo/core/constants/logger_devtool.dart';
import 'package:chateo/data/models/message_model.dart';
import 'package:chateo/data/repositories/firebase_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'messaging_event.dart';
part 'messaging_state.dart';

class MessagingBloc extends Bloc<MessagingEvent, MessagingState> {
  final FireMethodRepo fireMethodRepo;
  // StreamSubscription<QuerySnapshot>? _tickerSubscription;

  MessagingBloc(this.fireMethodRepo) : super(const MessagingState()) {
    _startListenToServer();
    on<ReservedMessageEvent>(_receivedMessage);
    on<SendMessageEvent>(_sendMessage);
  }

  FutureOr<void> _receivedMessage(
    ReservedMessageEvent event,
    Emitter<MessagingState> emit,
  ) {
    event.messages.length.logWtf();

    emit(state.copyWith(messagesList: event.messages));
  }

  User get getCurrentUser => FirebaseAuth.instance.currentUser!;

  bool isCurrentUserMessage(String id) => getCurrentUser.uid == id;

  FutureOr<void> _sendMessage(
    SendMessageEvent event,
    Emitter<MessagingState> emit,
  ) {
    final _newMessage = MessageModel(
      content: event.message,
      id: getCurrentUser.uid,
      date: Timestamp.now(),
    );
    fireMethodRepo.sendDataToFireStore(
      rootChatsCollection,
      _newMessage.toMap(),
    );
  }

  void _startListenToServer() {
    fireMethodRepo
        .receivedDataToFireStore(
      collectionPath: rootChatsCollection,
      orderBy: 'date',
    ).listen((event) {
      final data = event.docs
          .map(
            (DocumentSnapshot document) => MessageModel.fromMap(
              document.data()! as Map<String, dynamic>,
            ).copyWith(keyDoc: document.id),
          )
          .toList();
      data.length.logI();
      add(ReservedMessageEvent(data));
    });
  }
}
