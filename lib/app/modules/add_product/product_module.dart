import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controller/product_controller.dart';
import 'presentation/pages/add_product_page.dart';

class ProductModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => ProductController(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (ctx, args) => ProductPage(model: args.data)),
      ];
}
