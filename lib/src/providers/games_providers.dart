import 'package:dio/dio.dart';
import 'package:practicaapi/src/models/games_models.dart';

class GamesProvider {
  final String _api = 'https://www.freetogame.com/api/games';
  final _http = Dio();

  Future obtainGames() async {
    final _response = await _http.get(_api);
    List<dynamic> _data = _response.data;

    return _data.map((_data) => GamesModel.fromJson(_data)).toList();
  }

  Future obtainGamesW() async {
    final _responsew = await _http.get('$_api?platform=browser');
    List<dynamic> _dataw = _responsew.data;

    return _dataw.map((_dataw) => GamesModel.fromJson(_dataw)).toList();
  }
}
