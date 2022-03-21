import 'package:chateo/core/injector/inject.dart';
import 'package:chateo/data/repositories/firebase_repo.dart';
import 'package:chateo/logic/bloc/messaging/messaging_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'components/build_messages.dart';

class MessagesItemScreen extends StatelessWidget {
  const MessagesItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readFirebaseRepo = injector<FireMethodRepo>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MessagingBloc(readFirebaseRepo),
        ),
       
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: const _BuildChatBody(),
      ),
    );
  }
}

class _BuildChatBody extends HookWidget {
  const _BuildChatBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return Column(
      children: <Widget>[
        const Expanded(
          child: _BuildMessagesList(),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 1,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(
                                Icons.sentiment_satisfied,
                                size: 25,
                              ),
                              onPressed: emojiButton,
                            ),
                            Expanded(
                              child: TextField(
                                controller: controller,
                                minLines: 1,
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration.collapsed(
                                  hintText: 'Write a message',
                                ),
                                // onChanged: (term) {
                                //   showSend.value = term.isNotEmpty;
                                // },
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.photo_camera,
                                color: Color(0xff00897B),
                                size: 25,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: controller,
                      builder: (context, data, child) {
                        if (controller.value.text.isNotEmpty) {
                          return _FLoatActionWidget(
                            onPressed: () {
                              context.read<MessagingBloc>().add(
                                    SendMessageEvent(
                                      message: controller.value.text,
                                    ),
                                  );
                              controller.clear();
                            },
                            icon: Icons.send,
                          );
                        } else {
                          return _FLoatActionWidget(
                            icon: Icons.mic,
                            onPressed: () {},
                          );
                        }
                      },
                    ),
                    Container(width: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void emojiButton() {}
}

class _FLoatActionWidget extends StatelessWidget {
  const _FLoatActionWidget({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "fab1",
      elevation: 1,
      mini: true,
      backgroundColor: const Color(0xff00897B),
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class _BuildMessagesList extends StatelessWidget {
  const _BuildMessagesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final messages =
    //     context.select((MessagingBloc data) => data.state);
    return BlocBuilder<MessagingBloc, MessagingState>(
      buildWhen: (previous, current) =>
          previous.messagesList != current.messagesList,
      builder: (context, state) {
        return ListView.builder(
          reverse: true,
          itemCount: state.messagesList.length,
          itemBuilder: (context, index) {
            return BuildMessages(
              messageItem: state.messagesList[index],
              isMe: context
                  .read<MessagingBloc>()
                  .isCurrentUserMessage(state.messagesList[index].id),
              key: ValueKey(state.messagesList[index].keyDoc),
            );
          },
        );
      },
    );
  }
}
