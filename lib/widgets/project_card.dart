import 'package:flutter/material.dart';

import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Image.network(project.imageUrl),
        title: Text(project.title),
        subtitle: Text(project.description),
      ),
    );
  }
}
