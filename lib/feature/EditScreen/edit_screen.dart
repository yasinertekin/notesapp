import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notesapp/feature/EditScreen/edit_screen_provider.dart';
import 'package:notesapp/product/enum/my_color_enum.dart';
import 'package:notesapp/product/extensions/my_color_extensions.dart';
import 'package:notesapp/product/mixin/router/app_rouder_mixin.dart';
import 'package:notesapp/product/model/note_model.dart';
import 'package:notesapp/product/database/note_list_view_model.dart';
import 'package:notesapp/product/widgets/DescriptionTextField/description_text_field.dart';
import 'package:notesapp/product/widgets/TitleTextField/title_text_field.dart';

import '../../product/widgets/IconButton/ArrowBackIconButton/arrow_back_icon_button.dart';
import '../../product/widgets/IconButton/EditIconButton/edit_icon_button.dart';
import '../../product/widgets/IconButton/SaveIconButton/save_icon_button.dart';

// ignore: must_be_immutable
class EditScreen extends StatelessWidget with MyNavigatorManager {
  EditScreen({
    Key? key,
    this.noteModel,
    this.noteId,
  }) : super(key: key);

  NoteModel? noteModel;
  final NoteModel? noteId;
  final _noteStore = NoteStore();
  final editScreenProvider = EditScreenProvider();

  late final TextEditingController titleController = TextEditingController(
    text: titleText,
  );
  late final String titleText = noteModel?.title ?? _noteStore.noteModel.title ?? "";
  late final TextEditingController descriptionController = TextEditingController(
    text: descriptionText,
  );
  late final String descriptionText = noteModel?.description ?? _noteStore.noteModel.description ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(_noteStore, context),
      body: _EditScreenBody(
          editScreenProvider: editScreenProvider,
          descriptionController: descriptionController,
          noteModel: noteModel,
          noteStore: _noteStore,
          titleController: titleController,
          titleText: titleText,
          onTapped: editScreenProvider,
          descriptionText: descriptionText),
    );
  }

  AppBar _myAppBar(NoteStore noteStore, BuildContext context) {
    return AppBar(
      leading: const ArrowBackIconButton(),
      iconTheme: IconThemeData(color: MyColor.white.color),
      actions: [
        Observer(
          builder: (_) {
            return editScreenProvider.value
                ? EditIconButton(
                    noteModel: noteModel,
                    titleController: titleController,
                    descriptionController: descriptionController)
                : SaveIconButton(
                    noteStore: noteStore,
                    context: context,
                  );
          },
        )
      ],
    );
  }
}

class _EditScreenBody extends StatelessWidget {
  const _EditScreenBody({
    required this.noteModel,
    required this.noteStore,
    required this.titleText,
    required this.descriptionText,
    required this.titleController,
    required this.descriptionController,
    required this.onTapped,
    required this.editScreenProvider,
  });

  final NoteModel? noteModel;
  final NoteStore noteStore;
  final String titleText;
  final String descriptionText;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final EditScreenProvider onTapped;
  final EditScreenProvider editScreenProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Observer(builder: (_) {
          return TitleTextField(
            onTapped: onTapped,
            titleController: titleController,
            noteStore: noteStore,
            editScreenProvider: editScreenProvider,
          );
        }),
        Expanded(
          child: DescriptionTextField(
              noteStore: noteStore,
              noteModel: noteModel,
              descriptionText: descriptionText,
              descriptionController: descriptionController),
        ),
      ],
    );
  }
}
