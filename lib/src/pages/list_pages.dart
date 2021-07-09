import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicaapi/src/models/games_models.dart';
import 'package:practicaapi/src/providers/games_state.dart';
import 'package:practicaapi/src/style/style.dart' as theme;

class ListPages extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State {
  final _scrollController = ScrollController();
  bool _cargando = false;
  @override
  void initState() {
    final games = Get.put(GamesState());
    games.obtainGames();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 400) {
        if (_cargando == false) {
          setState(() {
            _cargando = true;
          });

          await games.obtainGames();
          setState(() {
            _cargando = false;
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.Colors.backgroundColor,
        title: Text(
          'JUEGOS GRATIS',
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      backgroundColor: theme.Colors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            GetBuilder<GamesState>(
              builder: (GamesState gamesState) {
                return GridView.builder(
                  controller: _scrollController,
                  itemCount: gamesState.index,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.13),
                  itemBuilder: (BuildContext context, int i) {
                    final _games = gamesState.games[i];
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/views',
                          arguments: _games),
                      child: Container(
                        height: 200,
                        child: Card(
                          color: theme.Colors.backgroundColor,
                          child: Container(
                            child: Column(
                              children: [
                                FadeInImage(
                                  placeholder: AssetImage('assets/carga.gif'),
                                  image: NetworkImage(_games.thumbnail!),
                                ),
                                _TitleGame(_games),
                                _DetailsGames(_games),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleGame extends StatelessWidget {
  final GamesModel _games;
  _TitleGame(this._games);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _games.title!,
            overflow: TextOverflow.fade,
            maxLines: 2,
            style: TextStyle(
                color: theme.Colors.secondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _DetailsGames extends StatelessWidget {
  final GamesModel _games;
  _DetailsGames(this._games);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _games.platform!,
            style: TextStyle(color: theme.Colors.grey),
          )
        ],
      ),
    );
  }
}
