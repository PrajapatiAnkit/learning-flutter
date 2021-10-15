import 'package:flutter/material.dart';
import 'package:learning/models/catalog.dart';
import 'package:learning/screens/home_detail.dart';
import 'package:learning/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  final catalogItems = CatalogModal.items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: catalogItems.length,
      itemBuilder: (context, index) {
        final catalog = catalogItems[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(
            catalog: catalog,
          ),
        );
      },
      physics: BouncingScrollPhysics(),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              catalogImage: catalog.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(context.accentColor).bold.make(),
                catalog.desc.text.make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          context.theme.buttonColor,
                        ),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        ),
                      ),
                      child: "Buy".text.make(),
                    ),
                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}
