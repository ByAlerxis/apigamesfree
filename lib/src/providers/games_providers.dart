import 'package:dio/dio.dart';
import 'package:practicaapi/src/models/games_models.dart';

class GamesProvider {
  final String _api = 'https://www.freetogame.com/api/games';
  final _http = Dio();

  Future obtainGames() async {
    final _response = await _http.get(_api);
    List<dynamic> _data = _response.data;
    List<GamesModel> _games = [];

    for (int i = 0; i < _data.length; i++) {
      final responseGames = await _http.get(_api);
      _games.add(GamesModel.fromJson(responseGames.data));
    }
  }
}
