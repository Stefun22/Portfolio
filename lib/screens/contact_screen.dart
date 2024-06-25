import 'package:flutter/material.dart';

import '../widgets/footer.dart';

class ContactScreen extends StatelessWidget {
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
                'Contact Me',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Email: your.email@example.com',
                style: TextStyle(fontSize: 18),
              ),
              // Add more contact details here
            ],
          ),
        ),
        Footer(),
      ],
    );
  }
}
