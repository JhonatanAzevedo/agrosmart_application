// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on _ProductController, Store {
  late final _$titleAtom =
      Atom(name: '_ProductController.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$typeAtom =
      Atom(name: '_ProductController.type', context: context);

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$priceAtom =
      Atom(name: '_ProductController.price', context: context);

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$ratingAtom =
      Atom(name: '_ProductController.rating', context: context);

  @override
  int get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(int value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_ProductController.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$filenameAtom =
      Atom(name: '_ProductController.filename', context: context);

  @override
  String get filename {
    _$filenameAtom.reportRead();
    return super.filename;
  }

  @override
  set filename(String value) {
    _$filenameAtom.reportWrite(value, super.filename, () {
      super.filename = value;
    });
  }

  late final _$pickdFileAtom =
      Atom(name: '_ProductController.pickdFile', context: context);

  @override
  PlatformFile? get pickdFile {
    _$pickdFileAtom.reportRead();
    return super.pickdFile;
  }

  @override
  set pickdFile(PlatformFile? value) {
    _$pickdFileAtom.reportWrite(value, super.pickdFile, () {
      super.pickdFile = value;
    });
  }

  late final _$uploadTaskAtom =
      Atom(name: '_ProductController.uploadTask', context: context);

  @override
  UploadTask? get uploadTask {
    _$uploadTaskAtom.reportRead();
    return super.uploadTask;
  }

  @override
  set uploadTask(UploadTask? value) {
    _$uploadTaskAtom.reportWrite(value, super.uploadTask, () {
      super.uploadTask = value;
    });
  }

  late final _$sucessUploadAtom =
      Atom(name: '_ProductController.sucessUpload', context: context);

  @override
  bool? get sucessUpload {
    _$sucessUploadAtom.reportRead();
    return super.sucessUpload;
  }

  @override
  set sucessUpload(bool? value) {
    _$sucessUploadAtom.reportWrite(value, super.sucessUpload, () {
      super.sucessUpload = value;
    });
  }

  late final _$urlDownloadAtom =
      Atom(name: '_ProductController.urlDownload', context: context);

  @override
  String get urlDownload {
    _$urlDownloadAtom.reportRead();
    return super.urlDownload;
  }

  @override
  set urlDownload(String value) {
    _$urlDownloadAtom.reportWrite(value, super.urlDownload, () {
      super.urlDownload = value;
    });
  }

  late final _$uploadFileAsyncAction =
      AsyncAction('_ProductController.uploadFile', context: context);

  @override
  Future<dynamic> uploadFile() {
    return _$uploadFileAsyncAction.run(() => super.uploadFile());
  }

  late final _$selectFileAsyncAction =
      AsyncAction('_ProductController.selectFile', context: context);

  @override
  Future<dynamic> selectFile() {
    return _$selectFileAsyncAction.run(() => super.selectFile());
  }

  late final _$_ProductControllerActionController =
      ActionController(name: '_ProductController', context: context);

  @override
  void onSaveProduct() {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.onSaveProduct');
    try {
      return super.onSaveProduct();
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProduct(ProductModel newModel) {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.setProduct');
    try {
      return super.setProduct(newModel);
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(dynamic value) {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRating(String value) {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.setRating');
    try {
      return super.setRating(value);
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(dynamic value) {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(dynamic value) {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.setType');
    try {
      return super.setType(value);
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(dynamic value) {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilename(dynamic value) {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.setFilename');
    try {
      return super.setFilename(value);
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
type: ${type},
price: ${price},
rating: ${rating},
description: ${description},
filename: ${filename},
pickdFile: ${pickdFile},
uploadTask: ${uploadTask},
sucessUpload: ${sucessUpload},
urlDownload: ${urlDownload}
    ''';
  }
}
