import 'package:cloud_firestore/cloud_firestore.dart';

class ProductEntity {
  String? created;
  String? description;
  DocumentReference? documentReference;
  String? filename;
  double? price;
  int? rating;
  String? title;
  String? type;
  int? id;

  ProductEntity({
    required this.title,
    required this.type,
    required this.description,
    required this.filename,
    required this.price,
    required this.rating,
    required this.created,
    required this.documentReference,
    required this.id,
  });
}
