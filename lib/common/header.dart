import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  String title;
  Header({required this.title, super.key});

  @override
  Size get preferredSize {
    return Size(double.infinity, 60.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.title),
      centerTitle: true,
      elevation: 0,
    );
  }
}
