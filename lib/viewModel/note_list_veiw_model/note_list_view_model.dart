// ignore_for_file: unused_local_variable, duplicate_ignore

import 'package:mobx/mobx.dart';
import 'package:notesapp/database/note_database_provider.dart';
import 'package:notesapp/model/note_model.dart';

part 'note_list_view_model.g.dart';

// ignore: library_private_types_in_public_api
class NoteStore = _NoteStore with _$NoteStore;

abstract class _NoteStore with Store {
  late NoteDatabaseProvider noteDatabaseProvider;

  _NoteStore() {
    initializeDatabase();
  }
  @observable
  String searchTerm = ''; // Arama terimini saklayan değişken

  @observable
  ObservableList<NoteModel> noteList = ObservableList<NoteModel>();

  @observable
  NoteModel noteModel = NoteModel();

  @action
  Future<void> initializeDatabase() async {
    noteDatabaseProvider = NoteDatabaseProvider();
    await noteDatabaseProvider.open();
    await getNoteList();
  }

  @action
  Future<void> getNoteList() async {
    final newNoteList = await noteDatabaseProvider.getList();
    noteList.clear(); // Mevcut notları temizleme
    noteList.addAll(newNoteList); // Yeni notları ekleme
  }

  @action
  // ignore: duplicate_ignore
  Future<void> saveModel() async {
    // ignore: unused_local_variable
    final result = await noteDatabaseProvider.insert(noteModel);

    await getNoteList();
  }

  @computed
  List<NoteModel> get filteredNotes {
    if (searchTerm.isEmpty) {
      return noteList.toList(); // Arama terimi boşsa, tüm notları döndür
    } else {
      return noteList.where((note) => note.title!.toLowerCase().contains(searchTerm.toLowerCase())).toList();
    }
  }

  @action
  Future<void> deleteModel(int index) async {
    await getNoteList();
    final result = await noteDatabaseProvider.delete(index);

    await getNoteList();
  }

  @action
  Future<void> updateModel(int id) async {
    final result = await noteDatabaseProvider.update(id, noteModel);
    await getNoteList();
  }
}
