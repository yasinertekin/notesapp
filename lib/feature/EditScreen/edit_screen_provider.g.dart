// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_screen_provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditScreenProvider on _EditScreenProviderBase, Store {
  late final _$valueAtom =
      Atom(name: '_EditScreenProviderBase.value', context: context);

  @override
  bool get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(bool value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$titleControllerAtom =
      Atom(name: '_EditScreenProviderBase.titleController', context: context);

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  late final _$titleTextAtom =
      Atom(name: '_EditScreenProviderBase.titleText', context: context);

  @override
  String get titleText {
    _$titleTextAtom.reportRead();
    return super.titleText;
  }

  @override
  set titleText(String value) {
    _$titleTextAtom.reportWrite(value, super.titleText, () {
      super.titleText = value;
    });
  }

  late final _$descriptionControllerAtom = Atom(
      name: '_EditScreenProviderBase.descriptionController', context: context);

  @override
  TextEditingController get descriptionController {
    _$descriptionControllerAtom.reportRead();
    return super.descriptionController;
  }

  @override
  set descriptionController(TextEditingController value) {
    _$descriptionControllerAtom.reportWrite(value, super.descriptionController,
        () {
      super.descriptionController = value;
    });
  }

  late final _$descriptionTextAtom =
      Atom(name: '_EditScreenProviderBase.descriptionText', context: context);

  @override
  String get descriptionText {
    _$descriptionTextAtom.reportRead();
    return super.descriptionText;
  }

  @override
  set descriptionText(String value) {
    _$descriptionTextAtom.reportWrite(value, super.descriptionText, () {
      super.descriptionText = value;
    });
  }

  late final _$_EditScreenProviderBaseActionController =
      ActionController(name: '_EditScreenProviderBase', context: context);

  @override
  void changeValue() {
    final _$actionInfo = _$_EditScreenProviderBaseActionController.startAction(
        name: '_EditScreenProviderBase.changeValue');
    try {
      return super.changeValue();
    } finally {
      _$_EditScreenProviderBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTitle(String newTitle) {
    final _$actionInfo = _$_EditScreenProviderBaseActionController.startAction(
        name: '_EditScreenProviderBase.updateTitle');
    try {
      return super.updateTitle(newTitle);
    } finally {
      _$_EditScreenProviderBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDescription(String newDescription) {
    final _$actionInfo = _$_EditScreenProviderBaseActionController.startAction(
        name: '_EditScreenProviderBase.updateDescription');
    try {
      return super.updateDescription(newDescription);
    } finally {
      _$_EditScreenProviderBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
titleController: ${titleController},
titleText: ${titleText},
descriptionController: ${descriptionController},
descriptionText: ${descriptionText}
    ''';
  }
}
