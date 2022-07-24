import 'package:template_modular_mobx_responsive/app/modules/page01/page01_Page.dart';
import 'package:template_modular_mobx_responsive/app/modules/page01/page01_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Page01Module extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Page01Store()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const Page01Page()),
  ];
}
