
import 'package:practicaapi/src/pages/web_page.dart';
import 'package:practicaapi/src/pages/list_pages.dart';
import 'package:practicaapi/src/providers/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:practicaapi/src/style/style.dart' as theme;
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final _menuState = Get.put(MenuState());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        builder: (MenuState menuState) {
          return _BodyMenu(menuState);
        },
        
      ),
      bottomNavigationBar: GetBuilder(
        builder: (MenuState menuState) {
          return BottomNavigationBar(
            unselectedItemColor: theme.Colors.grey,
            selectedFontSize: 17,
            unselectedFontSize: 15,
            selectedItemColor: theme.Colors.mainColor,
            backgroundColor: theme.Colors.backgroundColor,
            onTap: (int index) {
              menuState.index = index;
            },
            currentIndex: menuState.index,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.play_arrow_rounded, size: 30,),
                label: 'Juegos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.control_point_duplicate, size: 30,),
                label: 'Web',
              )
            ],
          );
        },
      ),
    );
  }
}

class _BodyMenu extends StatelessWidget {
  final MenuState menuState;
  _BodyMenu(this.menuState);
  @override
  Widget build(BuildContext context) {
    if (menuState.index == 0) {
      return ListPages();
    } else {
      return WebPages();
    }
  }
}
