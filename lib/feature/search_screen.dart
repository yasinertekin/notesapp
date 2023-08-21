import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:notesapp/product/enum/image_paths_enum.dart';
import 'package:notesapp/product/enum/my_color_enum.dart';
import 'package:notesapp/product/extensions/image_path_extensions.dart';
import 'package:notesapp/product/extensions/my_color_extensions.dart';
import 'package:notesapp/feature/EditScreen/edit_screen.dart';
import 'package:notesapp/feature/Home/home_screen.dart';
import 'package:notesapp/product/database/note_list_view_model.dart';

import '../product/mixin/router/app_rouder_mixin.dart';

class SearchScreen extends StatelessWidget with MyNavigatorManager {
  SearchScreen({super.key});
  final NoteStore _noteStore = NoteStore();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Padding(
              // ignore: deprecated_member_use
              padding: context.paddingLow,
              child: SearchBar(controller: _controller, noteStore: _noteStore),
            ),
          ),
        ),
        body: _controller.text.isEmpty
            ? const SizedBox.shrink()
            : _noteStore.filteredNotes.isEmpty && _noteStore.searchTerm.isNotEmpty
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
                          'No results found for "${_noteStore.searchTerm}" Try search again.',
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
                : _buildNoteListView());
  }

  ListView _buildNoteListView() {
    return ListView.builder(
      itemCount: _noteStore.filteredNotes.length,
      itemBuilder: (context, index) {
        return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              _noteStore.deleteModel(_noteStore.noteList[index].id!);
            },
            background: const BuildDeleteBackground(),
            child: _searchScreenCard(context, index));
      },
    );
  }

  Card _searchScreenCard(BuildContext context, int index) {
    return Card(
      color: MyColorExtension.getRandom().color,
      key: UniqueKey(),
      child: ListTile(
        onTap: () {
          navigatoToWidget(
            context,
            EditScreen(
              noteModel: _noteStore.noteList[index],
            ),
          );
        },
        title: _myCustomCardText(index, context),
      ),
    );
  }

  Text _myCustomCardText(int index, BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      _noteStore.noteList[index].title ?? '',
      // ignore: deprecated_member_use
      style: context.textTheme.headlineMedium?.copyWith(
        fontSize: 25,
        color: const Color(0xff000000),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required TextEditingController controller,
    required NoteStore noteStore,
  })  : _controller = controller,
        _noteStore = noteStore;

  final TextEditingController _controller;
  final NoteStore _noteStore;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColor.blackLiquorice.color,
      child: Padding(
        padding: context.padding.onlyLeftLow,
        child: SearchBarTextField(controller: _controller, noteStore: _noteStore),
      ),
    );
  }
}

class SearchBarTextField extends StatelessWidget {
  const SearchBarTextField({
    super.key,
    required TextEditingController controller,
    required NoteStore noteStore,
  })  : _controller = controller,
        _noteStore = noteStore;

  final TextEditingController _controller;
  final NoteStore _noteStore;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: _controller,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      style: context.textTheme.titleLarge?.copyWith(
        color: MyColor.white.color,
      ),
      onChanged: (value) => _noteStore.searchTerm = value,
      decoration: InputDecoration(
        suffix: IconButton(
          iconSize: 24,
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            _controller.clear();
            _noteStore.searchTerm = '';
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
    );
  }
}
