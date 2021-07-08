import 'package:get/get.dart';

class MenuState extends GetxController {
  int _index = 0;

  int get index => _index;

  set index(int i) {
    _index = i;
    update();
  }
}
