import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../responsive/responsive_layout.dart';
import 'devices_views/home_page_desktop.dart';
import 'devices_views/home_page_mobile.dart';
import 'devices_views/home_page_tablet.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return const ResponsiveLayout(
        mobileBody: HomePageMobile(),
        tabletBody: HomePageTablet(),
        desktopBody: HomePageDesktop(),
      );
    });
  }
}
