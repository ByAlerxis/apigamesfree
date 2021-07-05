import 'package:get/get.dart';
import 'package:practicaapi/src/models/games_models.dart';
import 'package:practicaapi/src/providers/games_providers.dart';

class GamesState extends GetxController {
  List<GamesModel> games = [];
  final gamesProvider = GamesProvider();

  Future<void> obtainGames() async {
    games.addAll(await gamesProvider.obtainGames());
    update();
  }
}
