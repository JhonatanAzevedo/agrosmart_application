// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$userListAtom =
      Atom(name: '_HomeController.userList', context: context);

  @override
  ObservableStream<List<ProductModel>>? get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(ObservableStream<List<ProductModel>>? value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$_HomeControllerActionController =
      ActionController(name: '_HomeController', context: context);

  @override
  void getListUser() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.getListUser');
    try {
      return super.getListUser();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userList: ${userList}
    ''';
  }
}
