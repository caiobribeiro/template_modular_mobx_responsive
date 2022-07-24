import 'package:flutter_modular/flutter_modular.dart';
import 'package:template_modular_mobx_responsive/app/modules/material3_demo_flutter_team/material3DemoFlutterTeam_module.dart';
import 'app_store.dart';
import 'modules/home/home_module.dart';
import 'modules/page01/page01_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AppStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: HomeModule(),
      transition: TransitionType.leftToRightWithFade,
    ),
    ModuleRoute(
      '/page01',
      module: Page01Module(),
      transition: TransitionType.rightToLeftWithFade,
    ),
    ModuleRoute(
      '/material3',
      module: Material3DemoFlutterTeamModule(),
      transition: TransitionType.rightToLeftWithFade,
    ),
  ];
}
