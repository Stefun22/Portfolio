import 'package:flutter/material.dart';

import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      if (c.maxWidth < 900) {
        return Card(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                SizedBox(width: 100, child: Image.network(project.imageUrl))
              ],
            ));
      }
      return Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              SizedBox(width: 500, child: Image.network(project.imageUrl))
            ],
          ));
    });
  }
}
