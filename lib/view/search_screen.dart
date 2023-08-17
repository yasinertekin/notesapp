import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:notesapp/enum/image_paths_enum.dart';
import 'package:notesapp/enum/my_color_enum.dart';
import 'package:notesapp/extensions/image_path_extensions.dart';
import 'package:notesapp/extensions/my_color_extensions.dart';
import 'package:notesapp/mixin/routing/app_rouder_mixin.dart';
import 'package:notesapp/view/editor_screen.dart';
import 'package:notesapp/viewModel/note_list_veiw_model/note_list_view_model.dart';

class SearchScreen extends StatelessWidget with MyNavigatorManager {
  SearchScreen({super.key});
  final NoteStore noteStore = NoteStore();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            // ignore: deprecated_member_use
            padding: context.paddingLow,
            child: Card(
              color: MyColor.blackLiquorice.color,
              child: Padding(
                padding: context.padding.onlyLeftLow,
                child: TextField(
                  autofocus: true,
                  controller: _controller,
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.text,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: MyColor.white.color,
                  ),
                  onChanged: (value) => noteStore.searchTerm = value,
                  decoration: InputDecoration(
                    suffix: IconButton(
                      iconSize: 24,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _controller.clear();
                        noteStore.searchTerm = '';
                      },
                    ),
                    hintText: 'Search by the keyword...',
                    // ignore: deprecated_member_use
                    hintStyle: context.textTheme.titleLarge?.copyWith(
                      color: const Color(0xffCCCCCC),
                      fontSize: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Observer(
        builder: (context) {
          return _controller.text.isEmpty
              ? const SizedBox.shrink()
              : noteStore.filteredNotes.isEmpty && noteStore.searchTerm.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImagePaths.searchscreenimage.toWidget(
                          height: context.dynamicHeight(0.2),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            textAlign: TextAlign.center,
                            'No results found for "${noteStore.searchTerm}" Try search again.',
                            style: context.textTheme.headlineMedium?.copyWith(
                              color: MyColor.white.color,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Go Back'))
                      ],
                    )
                  : ListView.builder(
                      itemCount: noteStore.filteredNotes.length,
                      itemBuilder: (context, index) {
                        final note = noteStore.filteredNotes[index];
                        return ListTile(
                          onTap: () {
                            navigatoToWidget(context, EditScreen(noteModel: note));
                          },
                          title: Text(note.title!),
                          // Diğer widget'lar...
                        );
                      },
                    );
        },
      ),
    );
  }
}
