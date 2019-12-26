


import 'package:flutterchatexample/modules/person/models/personEntity.dart';

class PersonModel {
  String documentID;
  String alias;
  String email;

  PersonModel({this.documentID, this.alias, this.email});

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      alias: json['alias'],
      email: json['email']
    );
  }

  toJson() {
    return {
      "alias": alias,
      "email": email,
    };
  }

  static PersonModel fromEntity(PersonEntity entity) {
    return PersonModel(
      documentID: entity.id,
      email: entity.email,
      alias: entity.alias,
    );
  }
}