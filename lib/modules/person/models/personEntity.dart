import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {

  final String id;
  final String email;
  final String alias;

  const PersonEntity(this.id, this.alias, this.email);

  static PersonEntity fromSnapshot(DocumentSnapshot snap) {
    return PersonEntity(
      snap.documentID,
      snap.data['alias'],
      snap.data['email'],
    );
  }

  @override
  List<Object> get props => [ id, alias, email];
}