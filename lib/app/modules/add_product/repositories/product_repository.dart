import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/product_model.dart';

abstract class IProductRepository {
  Stream<List<ProductModel>> getProducts();
}

class ProductRepository implements IProductRepository {
  FirebaseFirestore firebaseFirestore;

  ProductRepository({
    required this.firebaseFirestore,
  });

  @override
  Stream<List<ProductModel>> getProducts() {
    try {
      return firebaseFirestore.collection('products').snapshots().map(
        (query) {
          var result = query.docs.map((doc) {
            return ProductModel.fromMap(
              doc,
            );
          }).toList();
          result.sort((a, b) {
            if (a.id! > b.id!) {
              return 0;
            } else {
              return 1;
            }
          });
          return result;
        },
      );
    } catch (e) {
      throw Exception();
    }
  }
}
