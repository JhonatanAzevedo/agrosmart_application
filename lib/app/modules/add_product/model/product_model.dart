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

  Future delete() {
    return documentReference!.delete();
  }

  Future save() async {
    if (documentReference == null) {
      int total = await FirebaseFirestore.instance
          .collection('products')
          .get()
          .then((value) => value.docs.length);
      documentReference =
          await FirebaseFirestore.instance.collection('products').add(
        {
          'title': title,
          'type': type,
          'description': description,
          'filename': filename,
          'price': price,
          'rating': rating,
          'created': created,
          'id': total,
        },
      );
    } else {
      documentReference!.update(
        {
          'title': title,
          'type': type,
          'price': price,
          'filename': filename,
          'rating': rating,
          'created': created,
        },
      );
    }
  }
}
