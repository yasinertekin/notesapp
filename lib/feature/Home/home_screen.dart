import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:notesapp/product/enum/image_paths_enum.dart';
import 'package:notesapp/product/enum/my_color_enum.dart';
import 'package:notesapp/product/extensions/image_path_extensions.dart';
import 'package:notesapp/product/extensions/my_color_extensions.dart';
import 'package:notesapp/feature/EditScreen/edit_screen.dart';
import 'package:notesapp/product/widgets/HomeScreenTitleText/home_screen_title_text.dart';
import 'package:notesapp/product/widgets/IconButton/SearchBarIconButton/search_bar_icon_button.dart';

import '../../product/database/note_list_view_model.dart';
import '../../product/mixin/router/app_rouder_mixin.dart';
import '../../product/widgets/IconButton/InfoOutlineIconButton/info_outline_icon_button.dart';

class HomeScreen extends StatelessWidget with MyNavigatorManager {
  HomeScreen({super.key});

  final _noteStore = NoteStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: _HomeScreenAppBar(),
      ),
      floatingActionButton: _homeScreenFloatingActionButton(context),
      body: Observer(
        builder: (_) {
          return buildStackWithNotes(context);
        },
      ),
    );
  }

  Stack buildStackWithNotes(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _noteStore.noteList.isEmpty ? const BuildEmptyState() : const SizedBox.shrink(),
        Flexible(
          child: Padding(
            // ignore: deprecated_member_use
            padding: context.paddingLow,
            child: _buildNoteList(
              context,
            ),
          ),
        ),
      ],
    );
  }

  ListView _buildNoteList(pressController) {
    return ListView.builder(
      itemCount: _noteStore.noteList.length,
      itemBuilder: (context, index) {
        return _buildNoteDismissible(index, pressController);
      },
    );
  }

  Dismissible _buildNoteDismissible(int index, BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        _noteStore.deleteModel(_noteStore.noteList[index].id!);
      },
      background: const BuildDeleteBackground(),
      child: _myCustomCard(index, context),
    );
  }

  Card _myCustomCard(int index, BuildContext context) {
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

  FloatingActionButton _homeScreenFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        navigatoToWidget(context, EditScreen());
      },
      child: const Icon(Icons.add, color: Color(0xffFFFFFF)),
    );
  }
}

class _HomeScreenAppBar extends StatelessWidget {
  const _HomeScreenAppBar() : super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: MyColor.white.color),
      title: const HomeScreenTitleText(),
      actions: const [
        SearchBarIconButton(),
        InfoOutlineIconButton(),
      ],
    );
  }
}

class BuildEmptyState extends StatelessWidget {
  const BuildEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImagePaths.homescreenphoto.toWidget(
          // ignore: deprecated_member_use
          height: context.dynamicHeight(0.3),
        ),
        const HomeScreenBodyDescriptionText(),
      ],
    );
  }
}

class BuildDeleteBackground extends StatelessWidget {
  const BuildDeleteBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        color: const Color(0xffFF0000),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}

class HomeScreenBodyDescriptionText extends StatelessWidget {
  const HomeScreenBodyDescriptionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Create your first note !',
      // ignore: deprecated_member_use
      style: context.textTheme.titleLarge?.copyWith(
        fontSize: 20,
        color: const Color(0xffFFFFFF),
      ),
    );
  }
}
