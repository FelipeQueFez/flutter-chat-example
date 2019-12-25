import 'package:flutterchatexample/modules/person/models/personModel.dart';
import 'package:flutterchatexample/modules/person/providers/firebaselProvider.dart';

class FirebaseRepository {
  final FirebaseProvider _provider = new FirebaseProvider();

  Stream<List<PersonModel>> persons() {
    return _provider.getPersons();
  }

  Future<bool> addPerson(PersonModel model) async {
    return await _provider.addPerson(model);
  }
}
