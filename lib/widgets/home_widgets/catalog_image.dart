import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String catalogImage;
  const CatalogImage({Key? key, required this.catalogImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(catalogImage)
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}
