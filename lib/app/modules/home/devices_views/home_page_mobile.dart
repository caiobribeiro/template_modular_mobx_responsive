import 'package:flutter/material.dart';
import '../../../util/my_box.dart';
import '../../../util/my_tile.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_drawer.dart';

class HomePageMobile extends StatefulWidget {
  final String title;
  const HomePageMobile({Key? key, this.title = "Home"}) : super(key: key);

  @override
  State<HomePageMobile> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // first 4 boxes in grid
            AspectRatio(
              aspectRatio: 1,
              child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                  controller: ScrollController(),
                  itemCount: 16,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
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
                itemCount: 14,
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
    );
  }
}
