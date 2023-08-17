import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notesapp/enum/my_color_enum.dart';
import 'package:notesapp/extensions/my_color_extensions.dart';
import 'package:notesapp/viewModel/press_controller/press_controller.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/mixin/routing/app_rouder_mixin.dart';
import 'package:notesapp/viewModel/note_list_veiw_model/note_list_view_model.dart';
import 'package:notesapp/widgets/ArrowBackIconButton/arrow_back_icon_button.dart';
import 'package:notesapp/widgets/DescriptionTextField/description_text_field.dart';
import 'package:notesapp/widgets/EditIconButton/edit_icon_button.dart';
import 'package:notesapp/widgets/RemoveRedEyeIconButton/remove_red_eye_icon_button.dart';
import 'package:notesapp/widgets/SaveIconButton/save_icon_button.dart';
import 'package:notesapp/widgets/TitleTextField/title_text_field.dart';

// ignore: must_be_immutable
class EditScreen extends StatelessWidget with MyNavigatorManager {
  EditScreen({
    Key? key,
    this.noteModel,
    this.noteId,
  }) : super(key: key);

  NoteModel? noteModel;
  final NoteModel? noteId;
  final noteStore = NoteStore();

  PressController pressController = PressController();
  late final TextEditingController titleController = TextEditingController(
    text: titleText,
  );
  late final String titleText = noteModel?.title ?? noteStore.noteModel.title ?? "";
  late final TextEditingController descriptionController = TextEditingController(
    text: descriptionText,
  );
  late final String descriptionText = noteModel?.description ?? noteStore.noteModel.description ?? "";

  @override
  Widget build(BuildContext context) {
    final pressContoller = PressController();

    return Scaffold(
      appBar: _myAppBar(pressContoller, noteStore, context),
      body: _EditScreenBody(
          descriptionController: descriptionController,
          noteModel: noteModel,
          noteStore: noteStore,
          titleController: titleController,
          titleText: titleText,
          descriptionText: descriptionText),
    );
  }

  AppBar _myAppBar(PressController pressContoller, NoteStore noteStore, BuildContext context) {
    return AppBar(
      leading: const ArrowBackIconButton(),
      iconTheme: IconThemeData(color: MyColor.white.color),
      actions: [
        pressContoller.value && noteModel?.title != null
            ? Observer(
                builder: (_) {
                  return EditIconButton(
                      pressController: pressController,
                      noteModel: noteModel,
                      titleController: titleController,
                      descriptionController: descriptionController);
                },
              )
            : const RemoveRedEyeIconButton(),
        pressContoller.value && noteModel?.title == null
            ? SaveIconButton(noteStore: noteStore, context: context)
            : const SizedBox(),
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
  });

  final NoteModel? noteModel;
  final NoteStore noteStore;
  final String titleText;
  final String descriptionText;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleTextField(
            noteModel: noteModel, noteStore: noteStore, titleController: titleController, titleText: titleText),
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
