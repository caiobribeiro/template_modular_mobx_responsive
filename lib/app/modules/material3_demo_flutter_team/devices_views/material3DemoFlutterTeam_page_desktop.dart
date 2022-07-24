// ignore_for_file: file_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:template_modular_mobx_responsive/app/modules/material3_demo_flutter_team/material3DemoFlutterTeam_store.dart';
import 'package:flutter/material.dart';

class Material3DemoFlutterTeamPageDesktop extends StatefulWidget {
  final String title;
  const Material3DemoFlutterTeamPageDesktop(
      {Key? key, this.title = 'Material3DemoFlutterTeamPageDesktop'})
      : super(key: key);
  @override
  Material3DemoFlutterTeamPageDesktopState createState() =>
      Material3DemoFlutterTeamPageDesktopState();
}

class Material3DemoFlutterTeamPageDesktopState
    extends State<Material3DemoFlutterTeamPageDesktop> {
  final Material3DemoFlutterTeamStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
    );
  }
}
