import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:practicaapi/src/providers/menu_state.dart';
import 'package:practicaapi/src/style/style.dart' as theme;

class ConsolePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.Colors.backgroundColor,
        body: SafeArea(
        child: Center(child: Text('PORXIMAMENTE', style: TextStyle(fontSize: 30, color: theme.Colors.grey),),)
      ),
        bottomNavigationBar: GetBuilder(
          builder: (MenuState menuState) {
            return BottomNavigationBar(
              backgroundColor: theme.Colors.backgroundColor,
              selectedItemColor: theme.Colors.mainColor,
              unselectedItemColor: Colors.grey[600],
              onTap: (int index) {
                menuState.index = index;

                if (menuState.index == 0) {
                  Navigator.pushNamed(context, '/');
                }
              },
              currentIndex: menuState.index,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
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
