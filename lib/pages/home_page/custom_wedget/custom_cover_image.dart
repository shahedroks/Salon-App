import 'package:flutter/material.dart';

import '../../../utils/assets_path.dart';

class cover_image_widget extends StatelessWidget {
  const cover_image_widget({super.key});

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
        child: Image.asset("${ImagesPath.covoreImage}", fit: BoxFit.cover),
      ),
    );
  }
}
