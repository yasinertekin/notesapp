import 'package:notesapp/product/model/note_model.dart';
import 'package:sqflite/sqflite.dart';

class NoteDatabaseProvider {
  final String _noteDatabaseName = "noteDatabase";
  final String _noteTableName = "note";

  final int _version = 1;
  late Database database;

  String columnNoteTitle = "title";
  String columnNoteDescription = "description";
  String columnNoteId = "id";

  Future<void> open() async {
    database = await openDatabase(
      _noteDatabaseName,
      version: _version,
      onCreate: (db, version) {
        createTable(db);
      },
    );
  }

  Future<bool> insert(NoteModel model) async {
    open();
    final noteMaps = await database.insert(
      _noteTableName,
      model.toJson(),
    );
    // ignore: unnecessary_null_comparison
    return noteMaps != null;
  }

  Future<void> createTable(Database db) async {
    await db.execute(
      "CREATE TABLE $_noteTableName($columnNoteId INTEGER PRIMARY KEY AUTOINCREMENT,$columnNoteTitle VARCHAR(20), $columnNoteDescription VARCHAR(100))",
    );
  }

  Future<List<NoteModel>> getList() async {
    open();
    List<Map> noteMaps = await database.query(_noteTableName);
    return noteMaps.map((e) => NoteModel.fromJson(e.cast<String, dynamic>())).toList();
  }

  Future<bool> delete(int id) async {
    open();

    final noteMaps = await database.delete(
      _noteTableName,
      where: '$columnNoteId = ?',
      whereArgs: [id],
    );

    // ignore: unnecessary_null_comparison
    return noteMaps != null;
  }

  Future<bool> update(int id, NoteModel model) async {
    open();

    final noteMaps = await database.update(
      _noteTableName,
      {'title': model.title, 'description': model.description}, // başlık ve açıklama özelliklerini geçirin
      where: '$columnNoteId = ?',
      whereArgs: [id],
    );

    // ignore: unnecessary_null_comparison
    return noteMaps != null;
  }

  Future<NoteModel> getItem(int id) async {
    open();

    final noteMaps = await database.query(
      _noteTableName,
      where: '$columnNoteId = ?',
      columns: [columnNoteId],
      whereArgs: [id],
    );

    if (noteMaps.isEmpty) {
      throw Exception("Note not found");
    }

    return NoteModel.fromJson(noteMaps.first.cast<String, dynamic>());
  }

  Future<void> close() async => database.close();
}
