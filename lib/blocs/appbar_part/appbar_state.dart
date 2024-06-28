abstract class AppBarState {}

class InitialState extends AppBarState {}

class SeletedTile extends AppBarState {
  String tile = "Home";
  SeletedTile({required this.tile});
}
