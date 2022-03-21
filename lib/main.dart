import 'package:chateo/initialization_app.dart';
import 'package:chateo/logic/bloc_observer.dart';
import 'package:chateo/main_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() => BlocOverrides.runZoned(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
    //  await Firebase.initializeApp();
    // await initializeDependencies();
        await InitializationApp.ensureInitialize();

        //  await InitializationApp.init();
        // await initializeDependencies();
        // await Firebase.initializeApp();
        runApp(App());
      },
      blocObserver: AppBlocObserver(),
    );
        

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }



    // FirebaseFirestore.instance.collection(rootChatsCollection).add(
    //       MessageModel(
    //        content: 'message',
    //        date: getFormattedTimeEvent(DateTime.now().millisecondsSinceEpoch).toString(),
    //        fromMe: Random().nextBool(),
    //        id: Random().nextInt(50),
           
    //       ).toMap(),
    //     );

    // FirebaseFirestore.instance
    //     .collection(rootChatsCollection)
    //     .orderBy('createAt', descending: true)
    //     .snapshots()
    //     .listen((event) {
    //   event.docs.map((DocumentSnapshot document) {
    //     final data =
    //         MessageModel.fromMap(document.data() as Map<String, dynamic>);
    //     data.message.logD();
    //   }).toList();
    // });

