import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'edit_screen_provider.g.dart';

class EditScreenProvider = _EditScreenProviderBase with _$EditScreenProvider;

abstract class _EditScreenProviderBase with Store {
  @observable
  bool value = true;

  @observable
  late TextEditingController titleController = TextEditingController();

  @observable
  late String titleText = "";

  @observable
  late TextEditingController descriptionController = TextEditingController();

  @observable
  late String descriptionText = "";

  @action
  void changeValue() {
    value = false;
  }

  @action
  void updateTitle(String newTitle) {
    titleText = newTitle;
    titleController.text = newTitle;
  }

  @action
  void updateDescription(String newDescription) {
    descriptionText = newDescription;
    descriptionController.text = newDescription;
  }
}
