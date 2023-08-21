import 'package:flutter/material.dart';
import 'package:notesapp/product/enum/my_color_enum.dart';
import 'package:notesapp/product/extensions/my_color_extensions.dart';
import 'package:notesapp/product/database/note_list_view_model.dart';

import '../../../../feature/EditScreen/edit_screen_provider.dart';
import '../../../../feature/Home/home_screen.dart';
import '../../../mixin/router/app_rouder_mixin.dart';

class SaveIconButton extends StatelessWidget with MyNavigatorManager {
  final NoteStore noteStore;
  final BuildContext context;
  final editScreenProvider = EditScreenProvider();

  SaveIconButton({
    super.key,
    required this.noteStore,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColor.blackLiquorice.color,
      child: IconButton(
        onPressed: () {
          noteStore.saveModel();
          editScreenProvider.changeValue();

          navigatoToWidget(context, HomeScreen());
        },
        icon: const Icon(Icons.save),
      ),
    );
  }
}
