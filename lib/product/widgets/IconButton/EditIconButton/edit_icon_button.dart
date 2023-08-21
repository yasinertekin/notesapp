import 'package:flutter/material.dart';
import 'package:notesapp/product/database/note_list_view_model.dart';
import 'package:notesapp/product/extensions/my_color_extensions.dart';

import '../../../../feature/Home/home_screen.dart';
import '../../../enum/my_color_enum.dart';
import '../../../model/note_model.dart';

class EditIconButton extends StatelessWidget {
  const EditIconButton({
    super.key,
    required this.noteModel,
    required this.titleController,
    required this.descriptionController,
  });

  final NoteModel? noteModel;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    final noteStore = NoteStore();
    return Card(
      color: MyColor.blackLiquorice.color,
      child: IconButton(
        onPressed: () {
          noteModel?.title = titleController.text;
          noteModel?.description = descriptionController.text;
          noteStore.noteModel.title = titleController.text;
          noteStore.noteModel.description = descriptionController.text;

          noteStore.updateModel(noteModel?.id ?? 0);
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
