import 'package:flutter/material.dart';

class ItemAttribute extends StatelessWidget {
  const ItemAttribute({
    @required this.icon,
    @required this.description,
  });

  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 6),
        Text('$description'),
      ],
    );
  }
}