import 'dart:io';

class ContactModel {
  String username;
  String email;
  String phone;
  File? image;



  ContactModel(
      {required this.username,
      required this.email,
      required this.phone,
      this.image});

 static List<ContactModel> contacts = [];
}
