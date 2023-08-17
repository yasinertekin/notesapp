import 'package:flutter/material.dart';
import 'package:notesapp/enum/my_color_enum.dart';
import 'package:notesapp/extensions/my_color_extensions.dart';

class RemoveRedEyeIconButton extends StatelessWidget {
  const RemoveRedEyeIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColor.blackLiquorice.color,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
