import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    String? title,
    String? type,
    String? description,
    String? filename,
    double? price,
    int? rating,
    String? created,
    DocumentReference? documentReference,
    int? id,
  }) : super(
          title: title,
          type: type,
          description: description,
          filename: filename,
          price: price,
          rating: rating,
          created: created,
          documentReference: documentReference,
          id: id,
        );

  factory ProductModel.fromMap(
    QueryDocumentSnapshot doc,
  ) {
    return ProductModel(
      title: doc['title'] ?? '',
      type: doc['type'] ?? '',
      description: doc['description'] ?? '',
      filename: doc['filename'] ?? '',
      price: doc['price']?.toDouble(),
      rating: doc['rating']?.toInt(),
      created: doc['created'] ?? '',
      documentReference: doc.reference,
      id: doc['id'] ?? 0,
    );
  }

}
