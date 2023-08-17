import 'package:flutter/material.dart';
import 'package:notesapp/enum/my_color_enum.dart';
import 'package:notesapp/mixin/routing/app_rouder_mixin.dart';
import 'package:notesapp/extensions/my_color_extensions.dart';
import 'package:notesapp/viewModel/note_list_veiw_model/note_list_view_model.dart';

import '../../view/home_screen.dart';

class SaveIconButton extends StatelessWidget with MyNavigatorManager {
  final NoteStore noteStore;
  final BuildContext context;

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
          navigatoToWidget(context, HomeScreen());
        },
        icon: const Icon(Icons.save),
      ),
    );
  }
}
