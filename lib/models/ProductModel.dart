import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String name;
  String profileImg;
  String desc;
  int price;
  bool isAvailable;
  String details;

  DocumentReference reference;

  Product(
      {this.name, this.profileImg, this.desc, this.price, this.isAvailable, this.details});

  factory Product.fromJson(Map<dynamic, dynamic> json) =>
      _ProductFromJson(json);

  // 5
  Map<String, dynamic> toJson() => _ProductToJson(this);

  @override
  String toString() => "Product<$name>";
}

  // ignore: non_constant_identifier_names
  Product _ProductFromJson(Map<dynamic, dynamic> json) {
    return Product(
      name: json['name'] as String,
      profileImg: json['profileImg'] as String,
      desc: json['desc'] as String,
      price: json['price'] as int,
      isAvailable: json['isAvailable'] as bool,
      details: json['details'] as String,

    );
  }

//2
// ignore: non_constant_identifier_names
  Map<String, dynamic> _ProductToJson(Product instance) =>
      <String, dynamic> {
        'name': instance.name,
        'details':instance.details,
        'desc':instance.desc,
        'price':instance.price,
        'profileImg': instance.profileImg,
        'isAvailable':instance.isAvailable,

      };
  

