import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String id;
  Timestamp date;
  String content;
  String? keyDoc;
  // bool fromMe;
  // bool showTime = true;
  MessageModel({
    required this.id,
    required this.date,
    required this.content,
    this.keyDoc,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String,
      date: map['date'] as Timestamp,
      content: map['content'] as String,
      keyDoc: map['keyDoc'] as String?,
      // fromMe: map['fromMe'] as bool,
      // showTime: map['showTime'] as bool,
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'content': content,
      'keyDoc': keyDoc,
      // 'fromMe': fromMe,
      // 'showTime': showTime,
    };
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  MessageModel copyWith({
    String? id,
    Timestamp? date,
    String? content,
    String? keyDoc,
  }) {
    return MessageModel(
      id: id ?? this.id,
      date: date ?? this.date,
      content: content ?? this.content,
      keyDoc: keyDoc ?? this.keyDoc,
    );
  }
}

// class MessageModel {
//   String message;
//   String createAt;
//   String userId;
//   MessageModel({
//     required this.message,
//     required this.createAt,
//     required this.userId,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'message': message,
//       'createAt': createAt,
//       'userId': userId,
//     };
//   }

//   factory MessageModel.fromMap(Map<String, dynamic> map) {
//     return MessageModel(
//       message: map['message'] as String,
//       createAt: map['createAt'] as String,
//       userId: map['userId'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory MessageModel.fromJson(String source) =>
//       MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
// }
