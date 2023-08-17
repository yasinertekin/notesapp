import 'package:flutter/material.dart';
import 'package:notesapp/enum/my_color_enum.dart';
import 'package:notesapp/extensions/my_color_extensions.dart';
import 'package:notesapp/viewModel/press_controller/press_controller.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/viewModel/note_list_veiw_model/note_list_view_model.dart';

import '../../view/home_screen.dart';

class EditIconButton extends StatelessWidget {
  const EditIconButton({
    super.key,
    required this.pressController,
    required this.noteModel,
    required this.titleController,
    required this.descriptionController,
  });

  final PressController pressController;
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
          pressController.changeValue();
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
