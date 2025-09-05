import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () {},
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xff23AA49
          ),
          fontSize: 23,
          fontFamily: "Raleway",
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false, // 👈 aligns text near the leading icon
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
