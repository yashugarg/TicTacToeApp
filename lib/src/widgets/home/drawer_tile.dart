import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {this.icon, required this.text, required this.onTap, Key? key})
      : super(key: key);

  final VoidCallback onTap;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: icon != null
          ? Icon(
              icon,
              size: 20,
              color: Colors.grey,
            )
          : null,
      title: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.grey.shade100),
      ),
      onTap: onTap,
    );
  }
}
