import 'package:get/get.dart';
import 'package:practicaapi/src/models/games_models.dart';
import 'package:practicaapi/src/providers/games_providers.dart';

class GamesState extends GetxController {
  List<GamesModel> games = [];
  List<GamesModel> gamesW = [];
  final gamesProvider = GamesProvider();
  int index = 0;
  int indexw = 0;

  Future<void> obtainGames() async {
    games.addAll(await gamesProvider.obtainGames());
    index +=20;
    update();
  }

  Future<void> obtainGamesW() async {
    gamesW.addAll(await gamesProvider.obtainGamesW());
    indexw +=20;
    update();
  }
}
