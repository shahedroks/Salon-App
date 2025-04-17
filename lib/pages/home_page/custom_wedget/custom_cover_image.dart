import 'package:flutter/material.dart';

import '../../../utils/assets_path.dart';

class cover_image_widget extends StatelessWidget {
  var coverImagePicked;
  cover_image_widget({super.key, this.coverImagePicked});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Container(
        height: height * 0.3,
        width: width,
        decoration: BoxDecoration(),
        child:
            coverImagePicked != null
                ? Image.file(coverImagePicked, fit: BoxFit.cover)
                : Image.asset("${ImagesPath.nullImage}", fit: BoxFit.cover),
      ),
    );
  }
}
