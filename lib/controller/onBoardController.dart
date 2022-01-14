import 'package:get/get.dart';

class OnBoardController extends GetxController {
  int? _index = 1;
  int? get index => _index;

  void setIndex(int? index) {
    _index = index;
    update();
  }
}
