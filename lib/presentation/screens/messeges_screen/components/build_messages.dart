// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:chateo/core/constants/method_const.dart';
import 'package:chateo/data/models/message_model.dart';

class BuildMessages extends StatelessWidget {
  const BuildMessages({
    Key? key,
    required this.messageItem,
    required this.isMe,
  }) : super(key: key);
 
  final MessageModel messageItem;
 final bool isMe;

  @override
  Widget build(BuildContext context) {
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
                    messageItem.content,
                  ),
                ),
                const SizedBox(height: 3, width: 0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      getFormattedTimeEvent(messageItem.date.microsecondsSinceEpoch),
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
}








// class BuildMessages extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       reverse: true,
//       itemCount: 2,
//       itemBuilder: (ctx, index) => MessageBubble(

//         chatDocs[index].data()['text'],
//         chatDocs[index].data()['username'],
//         chatDocs[index].data()['userImage'],
//         chatDocs[index].data()['userId'] == user.uid,
//         key: ValueKey(chatDocs[index].id),
//       ),
//     );
//   }
// }

// class MessageBubble extends StatelessWidget {
//   const MessageBubble({
//     Key? key,
//     required this.message,
//     required this.userName,
//     required this.userImage,
//     required this.isMe,
//   }) : super(key: key);

//   @override
//   final String message;
//   final String userName;
//   final String userImage;
//   final bool isMe;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Row(
//           mainAxisAlignment:
//               isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                 color: isMe
//                     ? Colors.grey[300]
//                     : Theme.of(context).colorScheme.secondary,
//                 borderRadius: BorderRadius.only(
//                   topLeft: const Radius.circular(12),
//                   topRight: const Radius.circular(12),
//                   bottomLeft: !isMe
//                       ? const Radius.circular(0)
//                       : const Radius.circular(12),
//                   bottomRight: isMe
//                       ? const Radius.circular(0)
//                       : const Radius.circular(12),
//                 ),
//               ),
//               width: 140,
//               padding: const EdgeInsets.symmetric(
//                 vertical: 10,
//                 horizontal: 16,
//               ),
//               margin: const EdgeInsets.symmetric(
//                 vertical: 16,
//                 horizontal: 8,
//               ),
//               child: Column(
//                 crossAxisAlignment:
//                     isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     userName,
//                     //   style: TextStyle(
//                     //     fontWeight: FontWeight.bold,
//                     //   //   color: isMe
//                     //   //       ? Colors.black
//                     //   //       : Theme.of(context).accentTextTheme.title.color,
//                     //   // ),
//                   ),
//                   Text(
//                     message,
//                     // style: TextStyle(
//                     //   color: isMe
//                     //       ? Colors.black
//                     //       : Theme.of(context).accentTextTheme.title.color,
//                     // ),
//                     textAlign: isMe ? TextAlign.end : TextAlign.start,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         Positioned(
//           top: 0,
//           left: isMe ? null : 120,
//           right: isMe ? 120 : null,
//           child: CircleAvatar(
//             backgroundImage: NetworkImage(
//               userImage,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
