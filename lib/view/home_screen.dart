import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:notesapp/enum/my_color_enum.dart';
import 'package:notesapp/extensions/my_color_extensions.dart';
import 'package:notesapp/viewModel/press_controller/press_controller.dart';
import 'package:notesapp/view/editor_screen.dart';

import '../viewModel/note_list_veiw_model/note_list_view_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _noteStore = NoteStore();
  @override
  Widget build(BuildContext context) {
    PressController pressController = PressController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: MyColor.white.color),
        title: Text(
          'Notes',
          // ignore: deprecated_member_use
          style: context.textTheme.headlineMedium?.copyWith(
            fontSize: 43,
            fontWeight: FontWeight.w500,
            color: MyColor.white.color,
          ),
        ),
        actions: [
          Card(
            color: MyColor.blackLiquorice.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
          Card(
            color: const Color(0xff3b3b3b),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info_outline),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditScreen(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Color(0xffFFFFFF)),
      ),
      body: Observer(builder: (_) {
        return Stack(
          alignment: Alignment.center,
          children: [
            _noteStore.noteList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/homescreenphoto.png',
                        fit: BoxFit.contain,
                        // ignore: deprecated_member_use
                        height: context.dynamicHeight(0.3),
                      ),
                      Text(
                        'Create your first note !',
                        // ignore: deprecated_member_use
                        style: context.textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            Flexible(
              child: Padding(
                // ignore: deprecated_member_use
                padding: context.paddingLow,
                child: ListView.builder(
                  itemCount: _noteStore.noteList.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        _noteStore.deleteModel(_noteStore.noteList[index].id!);
                      },
                      background: Card(
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
                      ),
                      child: Observer(builder: (_) {
                        return Card(
                          child: ListTile(
                            leading: Text(_noteStore.noteList[index].description.toString()),
                            onTap: () {
                              pressController.changeValue();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditScreen(
                                      noteModel: _noteStore.noteList[index], noteId: _noteStore.noteList[index]),
                                ),
                              );
                            },
                            title: Text(
                              textAlign: TextAlign.center,
                              _noteStore.noteList[index].title ?? '',
                              // ignore: deprecated_member_use
                              style: context.textTheme.headlineMedium?.copyWith(
                                fontSize: 25,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
