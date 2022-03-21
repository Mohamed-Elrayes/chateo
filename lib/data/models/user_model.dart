import 'dart:convert';

class UserModel {
  String? id;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? profileImage;
  String? imageUrlServer;
  String? timeStamp;
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
    return <String, dynamic> {
      'id': id,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'profileImage': profileImage,
      'imageUrlServer': imageUrlServer,
      'timeStamp': timeStamp,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      phoneNumber: map['phoneNumber']as String,
      firstName: map['firstName']as String,
      lastName: map['lastName']as String,
      profileImage: map['profileImage']as String,
      imageUrlServer: map['imageUrlServer']as String,
      timeStamp: map['timeStamp']as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>,);
}
