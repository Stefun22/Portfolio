import 'package:flutter/material.dart';

import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
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
        ),
      ),
    );
  }
}
