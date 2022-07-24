import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../util/my_box.dart';
import '../../../util/my_tile.dart';
import '../../../widgets/custom_drawer.dart';
import '../../../widgets/custom_app_bar.dart';
import '../page01_store.dart';

class Page01Desktop extends StatefulWidget {
  final String title;
  const Page01Desktop({Key? key, this.title = 'Page01Desktop'})
      : super(key: key);
  @override
  Page01DesktopState createState() => Page01DesktopState();
}

class Page01DesktopState extends State<Page01Desktop> {
  final Page01Store store = Modular.get();
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
                        itemCount: 4,
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
                      itemCount: 7,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  // list of stuff
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
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
