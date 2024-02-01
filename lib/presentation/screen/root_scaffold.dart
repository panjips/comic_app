import 'package:comic_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

class RootScaffold extends StatefulWidget {
  const RootScaffold({super.key, required this.child});
  final Widget child;

  @override
  State<RootScaffold> createState() => _RootScaffoldState();
}

class _RootScaffoldState extends State<RootScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: slate[950],
      body: widget.child,
    );
  }
}
