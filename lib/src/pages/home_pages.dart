import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicaapi/src/models/games_models.dart';
import 'package:practicaapi/src/providers/games_state.dart';
import 'package:practicaapi/src/providers/menu_state.dart';
import 'package:practicaapi/src/style/style.dart' as theme;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State {
  final _scrollController = ScrollController();
  final _menuState = Get.put(MenuState());
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

          games.actu();
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
    final games = Get.put(GamesState());
    games.obtainGames();
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
                  itemCount: games.actu(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.16),
                  itemBuilder: (BuildContext context, int i) {
                    final _games = gamesState.games[i];
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/views',
                          arguments: _games),
                      child: Container(
                        height: 200,
                        child: Card(
                          color: theme.Colors.backgroundColor,
                          child: Positioned(
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
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: GetBuilder(
          builder: (MenuState menuState) {
            return BottomNavigationBar(
              backgroundColor: theme.Colors.backgroundColor,
              selectedItemColor: theme.Colors.mainColor,
              unselectedItemColor: Colors.grey[600],
              onTap: (int index) {
                menuState.index = index;

                if (menuState.index == 1) {
                  Navigator.pushNamed(context, '/console');
                } else if (menuState.index == 0) {
                  Navigator.pushNamed(context, '/');
                }
              },
              currentIndex: menuState.index,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: theme.Colors.grey,
                  icon: Icon(Icons.person),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.monitor),
                  label: 'Console',
                )
              ],
            );
          },
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
      child: Row(
        children: [
          Text(
            _games.title!,
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
        children: [Text(_games.platform!, style: TextStyle(color: theme.Colors.grey),)],
      ),
    );
  }
}
