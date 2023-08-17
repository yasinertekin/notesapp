import 'package:flutter/material.dart';
import 'package:notesapp/enum/my_color_enum.dart';
import 'package:notesapp/extensions/my_color_extensions.dart';
import 'package:notesapp/view/search_screen.dart';

class SearchBarIconButton extends StatelessWidget {
  const SearchBarIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColor.blackLiquorice.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SearchScreen(),
          );
        },
        icon: const Icon(Icons.search),
      ),
    );
  }
}
