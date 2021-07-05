import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicaapi/src/providers/games_state.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State {
  @override
  void initState() {
    final games = Get.put(GamesState());
    games.obtainGames();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GetBuilder<GamesState>(
              builder: (GamesState gamesState) {
                return GridView.builder(
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int i) {
                    final _games = gamesState.games[i];
                    return Image.network(_games.thumbnail!);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
