import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:respace/models/UserModel.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserAuth{
  String email;
  String password;
}

class DatabaseMethods{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  searchByName(String name){
    print(name);
    Firestore.instance.collection("users")
        .where("establishmentName", isEqualTo: name)
        .getDocuments();
  }

  Future<void> uploadingProductData(String _name, String _price,
      String _profileImg, bool _isAvailable, String desc, String details, String category) async {
    final  FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    await Firestore.instance.collection("products").add({
      'productName': _name,
      'productPrice': _price,
      'profileImg': _profileImg,
      'isAvailable': _isAvailable,
       'details': details,
      'desc':desc,
      'category': category,
      'uid':uid,

    });
  }

  Future<void> uploadingUserData(String name, String establishmentName,
      String establishmentImg, bool isRetailer, bool isProducer, String desc, String registrationNo,
      String address, String email, String telNo, String profileImg, bool isOwnAccount ) async {
    final  FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    await Firestore.instance.collection("users").add({
      'name': name,
      'establishmentName': establishmentName,
      'establishmentImg': establishmentImg,
      'desc':desc,
      'registrationNo':registrationNo,
      'isRetailer':isRetailer,
      'isProducer':isProducer,
      'address':address,
      'email': email,
      'telNo': telNo,
      'profileImg': profileImg,
      'isOwnAccount':isOwnAccount,
      'uid': uid,
    });
  }

  Future<void> editProduct(bool _isFavourite,String id) async {
    await Firestore.instance
        .collection("products")
        .document(id)
        .updateData({"isFavourite": !_isFavourite});
  }

  Future<void> deleteProduct(DocumentSnapshot doc) async {
    await Firestore.instance
        .collection("products")
        .document(doc.documentID)
        .delete();
  }



}
