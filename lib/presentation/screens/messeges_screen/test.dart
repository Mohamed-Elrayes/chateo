import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ChatWhatsAppRoute extends StatefulWidget {
  const ChatWhatsAppRoute();

  @override
  ChatWhatsAppRouteState createState() => ChatWhatsAppRouteState();
}

class ChatWhatsAppRouteState extends State<ChatWhatsAppRoute> {
  bool showSend = true;
  final TextEditingController inputController = TextEditingController();
  List<Message> items = [];
  late ChatWhatsAppAdapter adapter;

  @override
  void initState() {
    super.initState();
    items.add(
      Message.time(
        items.length,
        "Hai..",
        false,
        items.length % 5 == 0,
        Tools.getFormattedTimeEvent(DateTime.now().millisecondsSinceEpoch),
      ),
    );
    items.add(
      Message.time(
        items.length,
        "Hello!",
        true,
        items.length % 5 == 0,
        Tools.getFormattedTimeEvent(DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    adapter = ChatWhatsAppAdapter(context, items, onItemClick);

    return Scaffold(
      backgroundColor: const Color(0xffE8E9E4),
      appBar: AppBar(
        backgroundColor: const Color(0xff075E54),
        title: Row(
          children: <Widget>[
            const CircleImage(
              imageProvider: AssetImage('assets/t.jpg'),
              size: 40,
            ),
            Container(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Roberts",
                ),
                Container(height: 2),
                const Text(
                  "Online",
                )
              ],
            )
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (String value) {},
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "Settings",
                child: Text("Settings"),
              ),
            ],
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: adapter.getView(),
            ),
            Container(
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
                            onPressed: () {},
                          ),
                          Expanded(
                            child: TextField(
                              controller: inputController,
                              minLines: 1,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration.collapsed(
                                hintText: 'Write a message',
                              ),
                              onChanged: (term) {
                                setState(() {
                                  showSend = term.isNotEmpty;
                                });
                              },
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
                  FloatingActionButton(
                    heroTag: "fab1",
                    elevation: 1,
                    mini: true,
                    backgroundColor: const Color(0xff00897B),
                    child: Icon(
                      showSend ? Icons.send : Icons.mic,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (showSend) sendMessage();
                    },
                  ),
                  Container(width: 5)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onItemClick(int index, String obj) {}

  void sendMessage() {
    final String message = inputController.text;
    inputController.clear();
    showSend = false;
    setState(() {
      adapter.insertSingleItem(
        Message.time(
          adapter.getItemCount(),
          message,
          true,
          adapter.getItemCount() % 5 == 0,
          Tools.getFormattedTimeEvent(DateTime.now().millisecondsSinceEpoch),
        ),
      );
    });
    generateReply(message);
  }

  void generateReply(String msg) {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        adapter.insertSingleItem(
          Message.time(
            adapter.getItemCount(),
            msg,
            false,
            adapter.getItemCount() % 5 == 0,
            Tools.getFormattedTimeEvent(DateTime.now().millisecondsSinceEpoch),
          ),
        );
      });
    });
  }
}

class Tools {
  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static String allCaps(String str) {
    if (str.isNotEmpty) {
      return str.toUpperCase();
    }
    return str;
  }

  static String getFormattedDateShort(int time) {
    final DateFormat newFormat = DateFormat("MMM dd, yyyy");
    return newFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
  }

  static String getFormattedDateSimple(int time) {
    final DateFormat newFormat = DateFormat("MMMM dd, yyyy");
    return newFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
  }

  static String getFormattedDateEvent(int time) {
    final DateFormat newFormat = DateFormat("EEE, MMM dd yyyy");
    return newFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
  }

  static String getFormattedTimeEvent(int time) {
    final DateFormat newFormat = DateFormat("h:mm a");
    return newFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
  }

  static String getFormattedCardNo(String cardNo) {
    if (cardNo.length < 5) return cardNo;
    return cardNo.replaceAllMapped(
      RegExp(".{4}"),
      (match) => "${match.group(0)} ",
    );
  }
}

class CircleImage extends StatelessWidget {
  final double? size;
  final Color? backgroundColor;
  final ImageProvider imageProvider;

  const CircleImage({
    Key? key,
    required this.imageProvider,
    this.size,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    return Container(
      width: size ?? 20,
      height: size ?? 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: imageProvider,
        ),
      ),
    );
  }
}

class Message {
  int? id;
  late String date;
  late String content;
  late bool fromMe;
  bool showTime = true;

  Message(int id, String content, bool fromMe, String date) {
    this.id = id;
    this.date = date;
    this.content = content;
    this.fromMe = fromMe;
  }

  Message.time(
      int id, String content, bool fromMe, bool showTime, String date) {
    this.id = id;
    this.date = date;
    this.content = content;
    this.fromMe = fromMe;
    this.showTime = showTime;
  }
}

class ChatWhatsAppAdapter {
  List<Message> items = <Message>[];
  BuildContext context;
  Function onItemClick;
  ScrollController scrollController = ScrollController();

  ChatWhatsAppAdapter(this.context, this.items, this.onItemClick);

  void insertSingleItem(Message msg) {
    final int insertIndex = items.length;
    items.insert(insertIndex, msg);
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 100,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

  Widget getView() {
    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(vertical: 10),
      controller: scrollController,
      itemBuilder: (context, index) {
        final Message item = items[index];
        return buildListItemView(index, item);
      },
    );
  }

  Widget buildListItemView(int index, Message item) {
    final bool isMe = item.fromMe;
    return Wrap(
      alignment: isMe ? WrapAlignment.end : WrapAlignment.start,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          margin: EdgeInsets.fromLTRB(isMe ? 20 : 10, 5, isMe ? 10 : 20, 5),
          color: isMe ? const Color(0xffE1FFC7) : Colors.white,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  constraints: const BoxConstraints(minWidth: 150),
                  child: Text(
                    item.content,
                  ),
                ),
                const SizedBox(height: 3, width: 0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      item.date,
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Container(width: 3),
                    if (isMe)
                      const Icon(
                        Icons.done_all,
                        size: 12,
                        color: Color(0xff42BDEE),
                      )
                    else
                      const SizedBox(width: 0, height: 0)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  int getItemCount() => items.length;
}
