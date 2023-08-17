import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:notesapp/enum/my_color_enum.dart';
import 'package:notesapp/extensions/my_color_extensions.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/viewModel/note_list_veiw_model/note_list_view_model.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required this.noteModel,
    required this.noteStore,
    required this.titleText,
    required this.titleController,
  });

  final NoteModel? noteModel;
  final NoteStore noteStore;
  final String titleText;
  final TextEditingController titleController;
  @override
  Widget build(
    BuildContext context,
  ) {
    return TextField(
      controller: titleController,
      // ignore: deprecated_member_use
      style: context.textTheme.headlineMedium?.copyWith(
        fontSize: 35,
        color: MyColor.white.color,
      ),
      onChanged: (value) {
        noteStore.noteModel.title = value;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        // ignore: deprecated_member_use
        contentPadding: context.paddingLow,
        hintText: 'Title',
        // ignore: deprecated_member_use
        hintStyle: context.textTheme.headlineMedium?.copyWith(
          fontSize: 35,
          color: MyColor.hydrargyrum.color,
        ),
      ),
      keyboardAppearance: Brightness.dark,
      keyboardType: TextInputType.text,
    );
  }
}
