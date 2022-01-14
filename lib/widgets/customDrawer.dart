import 'package:flutter/material.dart';

class CustomDrawerController {
  late Function open;
  late Function close;
  late Function toggle;
  late Function isOpen;
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    required this.menuScreen,
  });

  final Widget menuScreen;

  @override
  _CustomDrawerState createState() => new _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          child: widget.menuScreen,
        ),
      ],
    );
  }
}
