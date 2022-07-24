import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    var myCustomDrawer = Drawer(
      elevation: 0,
      child: Column(
        children: [
          const AvatarGlow(
            endRadius: 50,
            glowColor: Colors.grey,
            child: DrawerHeader(
              child: Icon(
                Icons.dashboard,
                size: 64,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'H O M E',
              ),
              onTap: () => Modular.to.navigate('/'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                'P A G E  0 1',
              ),
              onTap: () => Modular.to.navigate('/page01/'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text(
                'M A T E R I A L  3',
              ),
              onTap: () => Modular.to.navigate('/material3/'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'L O G O U T',
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
    return myCustomDrawer;
  }
}
