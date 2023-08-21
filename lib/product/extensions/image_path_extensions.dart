import 'package:flutter/material.dart';
import 'package:notesapp/product/enum/image_paths_enum.dart';

extension ImagePathsExtension on ImagePaths {
  String path() {
    return 'assets/images/$name.png';
  }

  Widget toWidget({double height = 24}) {
    return Image.asset(path(), height: height);
  }
}
