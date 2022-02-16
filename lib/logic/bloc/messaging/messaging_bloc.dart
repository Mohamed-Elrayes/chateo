// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../../../core/constants/api_constant.dart';

// part 'messaging_event.dart';
// part 'messaging_state.dart';

// class MessagingBloc extends Bloc<MessagingEvent, MessagingState> {
//   MessagingBloc() : super() {
//     on<MessagingEvent>((event, emit) {});
//   }

//   callFirebase() {
//     Stream documentStream = FirebaseFirestore.instance
//         .collection(rootCollection)
//         .doc(rootDoc)
//         .collection(messageCollection)
//         .snapshots();
//     documentStream.listen((event) {});
//   }
// }
