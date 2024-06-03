import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green.shade100.withOpacity(0.1),
      title: const Text('J A B A S E E L A N   S'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          child: const Text('Home'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/about');
          },
          child: const Text('About'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/projects');
          },
          child: const Text('Projects'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/contact');
          },
          child: const Text('Contact'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
