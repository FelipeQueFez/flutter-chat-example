


import 'package:flutterchatexample/modules/firebase/models/personModel.dart';
import 'package:flutterchatexample/modules/firebase/providers/firebaselProvider.dart';

class FirebaseRepository {
  final FirebaseProvider _provider = new FirebaseProvider();

  Stream<List<PersonModel>> persons() {
    return _provider.getPersons();
  }

  Future<bool> addPerson(PersonModel model) async {
    return await _provider.addPerson(model);
  }
}
