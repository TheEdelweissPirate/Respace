import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:respace/models/UserModel.dart';

class DataRepository {
  // 1
  final CollectionReference collection = Firestore.instance.collection('Users');
  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }
  // 3
  Future<DocumentReference> addUser(The_User user) {
    return collection.add(user.toJson());
  }
  // 4
  updatePet(The_User user) async {
    await collection.document(user.reference.documentID).updateData(user.toJson());
  }
}