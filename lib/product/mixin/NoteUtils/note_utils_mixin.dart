import 'package:flutter/material.dart';
import 'package:notesapp/product/model/note_model.dart';

import '../../database/note_list_view_model.dart';

mixin NoteUtils {
  late final NoteModel noteModel; // noteModel'ı burada tanımlayın veya projenizin gereksinimine göre getirin
  late final NoteStore noteStore; // noteStore'u burada tanımlayın veya projenizin gereksinimine göre getirin

  dynamic getNoteProperty(NoteEnum property) {
    switch (property) {
      case NoteEnum.titleText:
        return noteModel.title ?? noteStore.noteModel.title ?? "";
      case NoteEnum.titleController:
        return TextEditingController(
          text: getNoteProperty(NoteEnum.titleText),
        );
      case NoteEnum.descriptionController:
        return TextEditingController(
          text: getNoteProperty(NoteEnum.descriptionText),
        );
      case NoteEnum.descriptionText:
        return noteModel.description ?? noteStore.noteModel.description ?? "";
      default:
        return null;
    }
  }
}

enum NoteEnum {
  titleText,
  titleController,
  descriptionController,
  descriptionText,
}
