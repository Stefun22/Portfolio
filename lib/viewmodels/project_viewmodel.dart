import '../models/project.dart';

class ProjectViewModel {
  List<Project> getProjects() {
    // Replace this with actual data fetching logic
    return [
      Project(
        title: 'Project 1',
        description: 'Description of project 1',
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Project(
        title: 'Project 2',
        description: 'Description of project 2',
        imageUrl: 'https://via.placeholder.com/150',
      ),
      // Add more projects here
    ];
  }
}
