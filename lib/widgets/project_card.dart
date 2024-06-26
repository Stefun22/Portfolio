import 'package:flutter/material.dart';
import 'package:portfolio_stefun_1/main.dart';
import 'package:portfolio_stefun_1/viewmodels/project_viewmodel.dart';

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
                SizedBox(width: 100, child: Image.network(project.company)),
              ],
            ));
      }
      return Card(
          color: Colors.white.withOpacity(0.1),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: Sizes.height / 2,
                height: Sizes.height / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder<String?>(
                        future: ProjectViewModel.downloadURLExample(
                            fileName: "${project.title}.jpeg"),
                        builder: (context, ds) {
                          return Container(
                            width: Sizes.height / 3.5,
                            height: Sizes.height / 3.5,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                                image: ds.connectionState ==
                                        ConnectionState.waiting
                                    ? null
                                    : DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(ds.data!),
                                        scale: 1)),
                            child: ds.connectionState == ConnectionState.waiting
                                ? const CircularProgressIndicator()
                                : const SizedBox(),
                          );
                        }),
                    const SizedBox(height: 30),
                    Text(
                      project.title,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              Column(
                  children: project.description
                      .map(
                        (e) => SizedBox(
                          width: Sizes.width / 1.5,
                          child: ListTile(
                            leading: const Icon(
                              Icons.arrow_circle_right_outlined,
                              color: Colors.lightGreen,
                            ),
                            title: Text(
                              e,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                      .toList())
            ],
          ));
    });
  }
}
