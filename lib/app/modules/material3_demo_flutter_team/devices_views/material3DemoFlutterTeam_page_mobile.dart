// ignore_for_file: file_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:template_modular_mobx_responsive/app/modules/material3_demo_flutter_team/material3DemoFlutterTeam_store.dart';
import 'package:flutter/material.dart';
import '../../../util/flutter_team_screens_show_case/color_palettes_screen.dart';
import '../../../util/flutter_team_screens_show_case/component_screen.dart';
import '../../../util/flutter_team_screens_show_case/elevation_screen.dart';
import '../../../util/flutter_team_screens_show_case/typography_screen.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_drawer.dart';

class Material3DemoFlutterTeamPageMobile extends StatefulWidget {
  final String title;
  const Material3DemoFlutterTeamPageMobile(
      {Key? key, this.title = 'Material3DemoFlutterTeamPageMobile'})
      : super(key: key);
  @override
  Material3DemoFlutterTeamPageMobileState createState() =>
      Material3DemoFlutterTeamPageMobileState();
}

class Material3DemoFlutterTeamPageMobileState
    extends State<Material3DemoFlutterTeamPageMobile> {
  final Material3DemoFlutterTeamStore store = Modular.get();

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 98,
            child: PageView(
              controller: _controller,
              children: const [
                Center(
                  child: ColorPalettesScreen(),
                ),
                Center(
                  child: ComponentScreen(
                    showNavBottomBar: true,
                  ),
                ),
                Center(
                  child: ElevationScreen(),
                ),
                Center(
                  child: TypographyScreen(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect: const SwapEffect(),
          ),
        ],
      ),
    );
  }
}
