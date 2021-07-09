import 'package:flutter/material.dart';
import 'package:practicaapi/src/models/games_models.dart';
import 'package:practicaapi/src/style/style.dart' as theme;
import 'package:url_launcher/url_launcher.dart';

class ViewsGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GamesModel _games =
        ModalRoute.of(context)!.settings.arguments as GamesModel;

    return Scaffold(
      backgroundColor: theme.Colors.backgroundColor,
      appBar: AppBar(
        title: Text(
          _games.title!,
          style: TextStyle(color: theme.Colors.secondaryColor),
        ),
        backgroundColor: theme.Colors.backgroundColor,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(_games.thumbnail!,
                    width: 3000, fit: BoxFit.cover),
              ),
              _DescripGame(_games),
            ],
          ),
        ),
      ),
    );
  }
}

class _DescripGame extends StatelessWidget {
  final GamesModel _games;
  _DescripGame(this._games);
  @override
  Widget build(BuildContext context) {
    final _genere = _games.genre!;
    final _plata = _games.platform!;
    final _fecha = _games.releaseDate!;
    final _mediaQuery = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _games.shortDescription!,
            style: TextStyle(color: theme.Colors.grey, fontSize: 20),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: theme.Colors.mainColor),
                child: Text('Genero: $_genere',
                    style: TextStyle(color: theme.Colors.grey, fontSize: 20)),
              ),
              Expanded(child: Container()),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                ),
                child: Text(
                  'Plataforma: $_plata',
                  style: TextStyle(color: theme.Colors.grey, fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal,
                ),
                child: Text('Fecha de salida: $_fecha',
                    style: TextStyle(color: theme.Colors.grey, fontSize: 20)),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                
                child: RaisedButton(
                  focusColor: Colors.indigoAccent,
                    elevation: 0,
                    color: theme.Colors.secondaryColor,
                    child: Text('Ir a la pagina'),
                    onPressed: () {
                      launch(_games.gameUrl!);
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
