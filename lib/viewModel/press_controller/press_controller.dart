import 'package:mobx/mobx.dart';

part 'press_controller.g.dart';

class PressController = PressControllerBase with _$PressController;

abstract class PressControllerBase with Store {
  @observable
  bool value = true;

  @action
  void changeValue() {
    value = !value;
  }
}
