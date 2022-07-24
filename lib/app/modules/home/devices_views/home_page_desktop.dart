import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../util/flutter_team_screens_show_case/color_palettes_screen.dart';
import '../../../util/flutter_team_screens_show_case/component_screen.dart';
import '../../../util/flutter_team_screens_show_case/elevation_screen.dart';
import '../../../util/flutter_team_screens_show_case/typography_screen.dart';
import '../../../util/my_box.dart';
import '../../../util/my_tile.dart';
import '../../../widgets/custom_drawer.dart';
import '../../../widgets/custom_app_bar.dart';

class HomePageDesktop extends StatefulWidget {
  final String title;
  const HomePageDesktop({Key? key, this.title = "Home"}) : super(key: key);

  @override
  State<HomePageDesktop> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageDesktop> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // open drawer
            const CustomDrawer(),

            // first half of page
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  // first 4 boxes in grid
                  AspectRatio(
                    aspectRatio: 4,
                    child: SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                        controller: ScrollController(),
                        itemCount: 8,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          return const MyBox();
                        },
                      ),
                    ),
                  ),

                  // list of previous days
                  Expanded(
                    child: ListView.builder(
                      controller: ScrollController(),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return MyYellowTile(
                          child: Container(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // second half of page
            Expanded(
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
