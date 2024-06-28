import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_stefun_1/blocs/appbar_part/appbar_events.dart';
import 'package:portfolio_stefun_1/blocs/appbar_part/appbar_state.dart';
import 'package:portfolio_stefun_1/screens/home_screen.dart';

class AppBarBloc extends Bloc<AppbarEvents, AppBarState> with GlobalKeys {
  AppBarBloc() : super(InitialState()) {
    on<ChangeSeletcion>(
        // ignore: invalid_use_of_visible_for_testing_member
        (event, state) => emit(SeletedTile(tile: event.selectedTile)));
  }
}
