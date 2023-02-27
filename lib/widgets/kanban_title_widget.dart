import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KanbanTitleWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const KanbanTitleWidget({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Text(title)
      ],
    );
  }
}
