import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:notesapp/product/enum/my_color_enum.dart';
import 'package:notesapp/product/extensions/my_color_extensions.dart';

import 'package:notesapp/product/model/note_model.dart';
import 'package:notesapp/product/database/note_list_view_model.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({
    super.key,
    required this.noteStore,
    required this.noteModel,
    required this.descriptionText,
    required this.descriptionController,
  });

  final NoteStore noteStore;
  final NoteModel? noteModel;
  final String descriptionText;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {},
      controller: descriptionController,
      onChanged: (value) {
        noteStore.noteModel.description = value;
      },
      // ignore: deprecated_member_use
      style: context.textTheme.headlineMedium?.copyWith(
        fontSize: 23,
        color: MyColor.white.color,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        // ignore: deprecated_member_use
        contentPadding: context.paddingLow,
        hintText: 'Start typing...',
        hintStyle: TextStyle(
          // ...

          color: MyColor.hydrargyrum.color,
        ),
      ),
    );
  }
}
