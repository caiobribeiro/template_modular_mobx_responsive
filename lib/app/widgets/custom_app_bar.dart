import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:template_modular_mobx_responsive/app/app_store.dart';

import '../util/glass_box.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final AppStore appStore = Modular.get<AppStore>();

  String getFirstRouteHistory(String path) {
    var history = Modular.to.navigateHistory;

    return history.first.name;
  }

  @override
  Widget build(BuildContext context) {
    var routes = ModalRoute.of(context)?.settings.name;

    OverlayEntry? entry;

    void hideOverlay() {
      entry?.remove();
      entry = null;
    }

    void showOberlay() {
      entry = OverlayEntry(
        builder: (context) => Container(
          alignment: const Alignment(0, 0),
          child: GlassBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 5, 5, 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        textStyle: const TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      hideOverlay();
                    },
                    child: const Text('X'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      final overlay = Overlay.of(context);
      overlay!.insert(entry!);
    }

    return Observer(builder: (_) {
      return AppBar(
        title: Text(routes!),
        actions: [
          Container(
            margin: const EdgeInsets.all(14),
            child: OutlinedButton(
              onPressed: () => showOberlay(),
              child: const Text("Overlay"),
            ),
          ),
          Switch(
            value: appStore.isDark,
            onChanged: (value) {
              appStore.changeTheme();
            },
          )
        ],
      );
    });
  }
}
