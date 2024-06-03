import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/project_bloc.dart';
import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';
import '../widgets/project_card.dart';

class ProjectsScreen extends StatelessWidget {
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
                    'My Projects',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  BlocBuilder<ProjectBloc, ProjectState>(
                    builder: (context, state) {
                      if (state is ProjectLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is ProjectLoaded) {
                        return Column(
                          children: state.projects
                              .map((project) => ProjectCard(project: project))
                              .toList(),
                        );
                      } else if (state is ProjectError) {
                        return Center(child: Text('Failed to load projects'));
                      }
                      return Container();
                    },
                  ),
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
