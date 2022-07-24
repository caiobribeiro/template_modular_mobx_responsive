import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:template_modular_mobx_responsive/app/modules/page01/page01_store.dart';
import 'package:flutter/material.dart';
import 'package:template_modular_mobx_responsive/app/responsive/responsive_layout.dart';
import 'devices_views/page01_desktop.dart';
import 'devices_views/page01_mobile.dart';
import 'devices_views/page01_tablet.dart';

class Page01Page extends StatefulWidget {
  final String title;
  const Page01Page({Key? key, this.title = 'Page01Page'}) : super(key: key);
  @override
  Page01PageState createState() => Page01PageState();
}

class Page01PageState extends State<Page01Page> {
  final Page01Store store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return const ResponsiveLayout(
        mobileBody: Page01Mobile(),
        tabletBody: Page01Tablet(),
        desktopBody: Page01Desktop(),
      );
    });
  }
}
