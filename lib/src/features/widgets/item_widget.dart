import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String name;

  const ItemWidget({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(name),
        leading: const CircleAvatar(
          foregroundImage: AssetImage('assets/images/flutter_logo.png'),
        ),
        onTap: () => onTap.call());
  }
}
