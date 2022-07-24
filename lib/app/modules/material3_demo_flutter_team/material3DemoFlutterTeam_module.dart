// ignore_for_file: file_names

import 'package:template_modular_mobx_responsive/app/modules/material3_demo_flutter_team/material3DemoFlutterTeam_Page.dart';
import 'package:template_modular_mobx_responsive/app/modules/material3_demo_flutter_team/material3DemoFlutterTeam_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Material3DemoFlutterTeamModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Material3DemoFlutterTeamStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const Material3DemoFlutterTeamPage()),
  ];
}
