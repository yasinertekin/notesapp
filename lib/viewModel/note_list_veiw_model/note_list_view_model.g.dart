// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteStore on _NoteStore, Store {
  late final _$noteListAtom = Atom(name: '_NoteStore.noteList', context: context);

  @override
  ObservableList<NoteModel> get noteList {
    _$noteListAtom.reportRead();
    return super.noteList;
  }

  @override
  set noteList(ObservableList<NoteModel> value) {
    _$noteListAtom.reportWrite(value, super.noteList, () {
      super.noteList = value;
    });
  }

  late final _$noteModelAtom = Atom(name: '_NoteStore.noteModel', context: context);

  @override
  NoteModel get noteModel {
    _$noteModelAtom.reportRead();
    return super.noteModel;
  }

  @override
  set noteModel(NoteModel value) {
    _$noteModelAtom.reportWrite(value, super.noteModel, () {
      super.noteModel = value;
    });
  }

  late final _$initializeDatabaseAsyncAction = AsyncAction('_NoteStore.initializeDatabase', context: context);

  @override
  Future<void> initializeDatabase() {
    return _$initializeDatabaseAsyncAction.run(() => super.initializeDatabase());
  }

  late final _$getNoteListAsyncAction = AsyncAction('_NoteStore.getNoteList', context: context);

  @override
  Future<void> getNoteList() {
    return _$getNoteListAsyncAction.run(() => super.getNoteList());
  }

  late final _$saveModelAsyncAction = AsyncAction('_NoteStore.saveModel', context: context);

  @override
  Future<void> saveModel() {
    return _$saveModelAsyncAction.run(() => super.saveModel());
  }

  late final _$deleteModelAsyncAction = AsyncAction('_NoteStore.deleteModel', context: context);

  @override
  Future<void> deleteModel(int index) {
    return _$deleteModelAsyncAction.run(() => super.deleteModel(index));
  }

  late final _$updateModelAsyncAction = AsyncAction('_NoteStore.updateModel', context: context);

  @override
  Future<void> updateModel(int id) {
    return _$updateModelAsyncAction.run(() => super.updateModel(id));
  }

  @override
  String toString() {
    return '''
noteList: ${noteList},
noteModel: ${noteModel}
    ''';
  }
}
