import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../model/product_model.dart';

part 'product_controller.g.dart';

class ProductController = _ProductController with _$ProductController;

abstract class _ProductController with Store {
  ProductModel? model = ProductModel();
  var dateCreated = DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
  @observable
  String title = '';

  @observable
  String type = '';

  @observable
  double price = 0.0;

  @observable
  int rating = 0;

  @observable
  String description = '';

  @observable
  String filename = '';

  @observable
  PlatformFile? pickdFile;

  @observable
  UploadTask? uploadTask;
  @observable
  bool? sucessUpload = false;

  @observable
  String urlDownload = '';

  @action
  Future uploadFile() async {
    final path = 'files/${pickdFile!.name}';
    final file = File(pickdFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);

    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(
      () {
        sucessUpload = true;
      },
    );
    urlDownload = await snapshot.ref.getDownloadURL();

    filename = urlDownload;
    uploadTask = null;
  }

  Future delete() {
    return model!.documentReference!.delete();
  }

  

  @action
  void onSaveProduct() {
    model!.rating == null || rating == 0
        ? model!.rating = 0
        : model!.rating = rating;
    title == '' ? null : model!.title = title;
    model!.created = dateCreated;
    price == 0 ? null : model!.price = price;
    type == '' ? null : model!.type = type;
    filename == '' ? null : model!.filename = filename;
    save();
  }


  

  @action
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    pickdFile = result.files.first;
  }

  @action
  void setProduct(ProductModel newModel) {
    model = newModel;
  }

  @action
  void setTitle(value) {
    title = value;
  }

  @action
  void setRating(String value) {
    if (value == '' || value.isEmpty) {
      rating = 0;
    } else {
      rating = int.parse(value);
      model!.rating = int.parse(value);
    }
  }

  @action
  void setPrice(value) {
    if (value == '') {
      price = 0;
    } else {
      price = double.parse(value);
    }
  }

  @action
  void setType(value) {
    type = value;
  }

  @action
  void setDescription(value) {
    description = value;
  }

  @action
  void setFilename(value) {
    filename = value;
  }


  Future save() async {
    if (model!.documentReference == null) {
      int total = await FirebaseFirestore.instance
          .collection('products')
          .get()
          .then((value) => value.docs.length);
      model!.documentReference =
          await FirebaseFirestore.instance.collection('products').add(
        {
          'title': model!.title,
          'type': model!.type,
          'description': model!.description,
          'filename': model!.filename,
          'price': model!.price,
          'rating': model!.rating,
          'created': model!.created,
          'id': total,
        },
      );
    } else {
      model!.documentReference!.update(
        {
          'title': model!.title,
          'type': model!.type,
          'price': model!.price,
          'filename': model!.filename,
          'rating': model!.rating,
          'created': model!.created,
        },
      );
    }
  }
}
