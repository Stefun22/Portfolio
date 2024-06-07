import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green.withOpacity(0.5),
      title: const Text('J A B A S E E L A N   S'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          child: Text(
            'Home',
            style: TextStyle(color: Colors.white.withOpacity(0.8)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/about');
          },
          child: Text(
            'About',
            style: TextStyle(color: Colors.white.withOpacity(0.8)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/projects');
          },
          child: Text(
            'Projects',
            style: TextStyle(color: Colors.white.withOpacity(0.8)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/contact');
          },
          child: Text(
            'Contact',
            style: TextStyle(color: Colors.white.withOpacity(0.8)),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
