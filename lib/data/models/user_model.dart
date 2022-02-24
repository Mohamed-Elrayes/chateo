
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? profileImage;
  String? imageUrlServer;
  String?  timeStamp;
  UserModel({
     this.id,
     this.phoneNumber,
     this.firstName,
    this.lastName,
    this.profileImage,
    this.imageUrlServer,
    this.timeStamp,
  });
 

 



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'profileImage': profileImage,
      'imageUrlServer': imageUrlServer,
      'timeStamp': timeStamp,
    };
  }



}
