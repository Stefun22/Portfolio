import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/project.dart';
import '../viewmodels/project_viewmodel.dart';

abstract class ProjectEvent {}

class FetchProjects extends ProjectEvent {}

abstract class ProjectState {}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectLoaded extends ProjectState {
  final List<Project> projects;

  ProjectLoaded({required this.projects});
}

class ProjectError extends ProjectState {
  final String message;

  ProjectError({required this.message});
}

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectViewModel projectViewModel = ProjectViewModel();

  ProjectBloc() : super(ProjectInitial()) {
    on<FetchProjects>((event, emit) async {
      emit(ProjectLoading());
      try {
        final projects = projectViewModel.getProjects();
        emit(ProjectLoaded(projects: projects));
      } catch (e) {
        emit(ProjectError(message: e.toString()));
      }
    });
  }
}
