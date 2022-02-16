class UserModel {
  String id;
  String firstName;
  String? lastName;
  String phoneNumber;
  String image;
  UserModel({
    required this.id,
    required this.firstName,
    this.lastName,
    required this.phoneNumber,
    required this.image,
  });
}
