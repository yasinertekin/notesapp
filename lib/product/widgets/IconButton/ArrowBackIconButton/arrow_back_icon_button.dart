import 'package:flutter/material.dart ';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notesapp/product/enum/my_color_enum.dart';
import 'package:notesapp/product/extensions/my_color_extensions.dart';

import '../../../../feature/Home/home_screen.dart';
import '../../../mixin/router/app_rouder_mixin.dart';

class ArrowBackIconButton extends StatelessWidget with MyNavigatorManager {
  const ArrowBackIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Card(
        color: MyColor.blackLiquorice.color,
        elevation: 0,
        child: IconButton(
          onPressed: () {
            navigatoToWidget(context, HomeScreen());
          },
          icon: const Icon(Icons.arrow_back),
        ),
      );
    });
  }
}
