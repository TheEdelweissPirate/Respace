import 'package:cloud_firestore/cloud_firestore.dart';

import 'ProductModel.dart';

// ignore: camel_case_types
class The_User{
  bool isProducer ;
  bool isRetailer;
  bool isOwnAccount;
  String name;
  String desc;
  String profileImg;
  String telNo;
  String address;
  String email;
  String registrationNo;
  String establishmentImg;
  String establishmentName;

  // ignore: deprecated_member_use
  List<Product> products = List<Product>();
  
  DocumentReference reference;

  The_User({this.products, this.name,this.establishmentName, this.isProducer, this.desc, this.profileImg, this.email,this.address, this.telNo, this.isOwnAccount, this.establishmentImg, this.isRetailer, this.registrationNo});


  factory The_User.fromSnapshot(DocumentSnapshot snapshot) {
    The_User newThe_User = The_User.fromJson(snapshot.data);
    newThe_User.reference = snapshot.reference;
    return newThe_User;
  }
  
  
  
  factory The_User.fromJson(Map<dynamic, dynamic> json) => _The_UserFromJson(json);
  
  Map<String, dynamic> toJson() => _The_UserToJson(this);
  @override
  String toString() => "The_User<$establishmentName>";

}

// ignore: non_constant_identifier_names
The_User _The_UserFromJson(Map<dynamic, dynamic> json) {
  return The_User(
    name: json['name'] as String,
    email: json['email'] as String,
    establishmentName: json['establishmentName'] as String,
    establishmentImg: json['establishmentImg'] as String,
    profileImg: json['profileImg'] as String,
    registrationNo: json['registrationNo'] as String,
    isProducer: json['isProducer'] as bool,
    isRetailer: json['isRetailer'] as bool,
    desc: json['desc'] as String,
    address: json['address'] as String,
    telNo: json['telNo'] as String,
    isOwnAccount: json['isOwnAccount'] as bool,
    products: _convertProducts(json['Products'] as List)
  );
}

// ignore: non_constant_identifier_names
List<Product> _convertProducts(List ProductMap) {
  if (ProductMap == null) {
    return null;
  }
  // ignore: deprecated_member_use
  List<Product> products =  List<Product>();
  ProductMap.forEach((value) {
    products.add(Product.fromJson(value));
  });
  return products;
}
//2
// ignore: non_constant_identifier_names
Map<String, dynamic> _The_UserToJson(The_User instance) =>
    <String, dynamic> {
      'name': instance.name,
      'establishmentName': instance.establishmentName,
      'establishmentImg': instance.establishmentImg,
      'desc':instance.desc,
      'registrationNo':instance.registrationNo,
      'isRetailer':instance.isRetailer,
      'isProducer':instance.isProducer,
      'address': instance.address,
      'email': instance.email,
      'telNo': instance.telNo,
      'profileImg': instance.profileImg,
      'isOwnAccount': instance.isOwnAccount,
      'products': _ProductList(instance.products),
    };

// ignore: non_constant_identifier_names
List<Map<String, dynamic>> _ProductList(List<Product> products) {
  if (products == null) {
    return null;
  }
  // ignore: deprecated_member_use, non_constant_identifier_names
  List<Map<String, dynamic>> ProductMap =List<Map<String, dynamic>>();
  // ignore: non_constant_identifier_names
  products.forEach((Product) {
    ProductMap.add(Product.toJson());
  });
  return ProductMap;
}


