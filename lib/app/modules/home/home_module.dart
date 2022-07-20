import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../add_product/product_module.dart';
import '../add_product/repositories/product_repository.dart';
import 'presentation/controller/home_controller.dart';
import 'presentation/page/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => HomeController(i()),
        ),
        Bind<IProductRepository>(
          (i) =>
              ProductRepository(firebaseFirestore: FirebaseFirestore.instance),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (ctx, args) => const HomePage()),
        ModuleRoute("/product", module: ProductModule()),
      ];
}
