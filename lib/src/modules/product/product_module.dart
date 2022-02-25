import 'package:flutter_modular/flutter_modular.dart';

import 'view/list_product_page.dart';
import 'view/product_page.dart';

class ProductModule extends Module{


  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [];


  @override
  List<ModularRoute> get routes => [
    ChildRoute("/", child: (_, __) => const ProductPage()),
    ChildRoute("/list", child: (_, __) => const ListProductPage()),
  ];


}