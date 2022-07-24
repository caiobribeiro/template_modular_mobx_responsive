import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:template_modular_mobx_responsive/app/modules/page01/page01_store.dart';

import '../../../util/my_box.dart';
import '../../../util/my_tile.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_drawer.dart';

class Page01Tablet extends StatefulWidget {
  final String title;
  const Page01Tablet({Key? key, this.title = 'Page01Tablet'}) : super(key: key);
  @override
  Page01PageState createState() => Page01PageState();
}

class Page01PageState extends State<Page01Tablet> {
  final Page01Store store = Modular.get();

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
              aspectRatio: 4,
              child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                  controller: ScrollController(),
                  itemCount: 14,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                itemCount: 16,
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
