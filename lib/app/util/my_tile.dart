import 'package:flutter/material.dart';

class MyYellowTile extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final child;
  const MyYellowTile({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 78,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
      ),
    );
  }
}
