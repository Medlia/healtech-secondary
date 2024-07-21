import 'package:flutter/material.dart';

class OptionsContainer extends StatelessWidget {
  const OptionsContainer({
    super.key,
    required this.tiles,
  });

  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xffdbdcdc),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: tiles,
      ),
    );
  }
}
