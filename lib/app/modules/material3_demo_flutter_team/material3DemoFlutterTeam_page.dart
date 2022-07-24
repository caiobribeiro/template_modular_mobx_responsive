// ignore_for_file: file_names

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:template_modular_mobx_responsive/app/modules/material3_demo_flutter_team/material3DemoFlutterTeam_store.dart';
import 'package:flutter/material.dart';

import '../../responsive/responsive_layout.dart';
import 'devices_views/material3DemoFlutterTeam_page_desktop.dart';
import 'devices_views/material3DemoFlutterTeam_page_mobile.dart';
import 'devices_views/material3DemoFlutterTeam_page_tablet.dart';

class Material3DemoFlutterTeamPage extends StatefulWidget {
  final String title;
  const Material3DemoFlutterTeamPage(
      {Key? key, this.title = 'Material3DemoFlutterTeamPage'})
      : super(key: key);
  @override
  Material3DemoFlutterTeamPageState createState() =>
      Material3DemoFlutterTeamPageState();
}

class Material3DemoFlutterTeamPageState
    extends State<Material3DemoFlutterTeamPage> {
  final Material3DemoFlutterTeamStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return const ResponsiveLayout(
        mobileBody: Material3DemoFlutterTeamPageMobile(),
        tabletBody: Material3DemoFlutterTeamPageTablet(),
        desktopBody: Material3DemoFlutterTeamPageDesktop(),
      );
    });
  }
}
