import 'package:mobx/mobx.dart';

import '../../../add_product/model/product_model.dart';
import '../../../add_product/repositories/product_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final IProductRepository repository;

  _HomeController(this.repository);

  @observable
  ObservableStream<List<ProductModel>>? userList;

  @action
  void getListUser() {
    userList = repository.getProducts().asObservable();

  }
  
}
