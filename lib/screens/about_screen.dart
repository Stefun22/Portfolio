import 'package:flutter/material.dart';

import '../widgets/footer.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Me',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'I am a passionate Flutter developer with over X years of experience...',
                style: TextStyle(fontSize: 18),
              ),
              // Add more about content here
            ],
          ),
        ),
        Footer(),
      ],
    );
  }
}
