import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:notesapp/feature/EditScreen/edit_screen_provider.dart';
import 'package:notesapp/product/enum/my_color_enum.dart';
import 'package:notesapp/product/extensions/my_color_extensions.dart';
import 'package:notesapp/product/database/note_list_view_model.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required this.onTapped,
    required this.titleController,
    required this.noteStore,
    required this.editScreenProvider,
  });

  final EditScreenProvider onTapped;
  final TextEditingController titleController;
  final NoteStore noteStore;
  final EditScreenProvider editScreenProvider;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        onTapped.changeValue();
      },
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
