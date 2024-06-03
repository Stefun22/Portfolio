import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.green.shade100.withOpacity(0.1),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Follow me on social media:'),
              IconButton(
                icon: const Icon(Icons.facebook),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.whatshot_sharp),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.link),
                onPressed: () {},
              ),
              // Add more social media icons here
            ],
          ),
        ],
      ),
    );
  }
}
