import 'package:flutter_bloc/flutter_bloc.dart';

import '../../viewmodels/project_viewmodel.dart';
import 'project_events.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectViewModel projectViewModel = ProjectViewModel();

  ProjectBloc() : super(ProjectInitial()) {
    on<FetchProjects>((event, emit) async {
      emit(ProjectLoading());
      try {
        final projects = await projectViewModel.getProjects();
        projects.sort((a, b) => a.order.compareTo(b.order));
        emit(ProjectLoaded(projects: projects));
      } catch (e) {
        emit(ProjectError(message: e.toString()));
      }
    });
  }
}
