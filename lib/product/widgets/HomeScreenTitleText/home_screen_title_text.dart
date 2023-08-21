import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:notesapp/product/enum/my_color_enum.dart';
import 'package:notesapp/product/extensions/my_color_extensions.dart';

class HomeScreenTitleText extends StatelessWidget {
  const HomeScreenTitleText({
    super.key,
  }) : super();

  final String _title = 'Notes';

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      // ignore: deprecated_member_use
      style: context.textTheme.headlineMedium?.copyWith(
        fontSize: 43,
        fontWeight: FontWeight.w500,
        color: MyColor.white.color,
      ),
    );
  }
}
