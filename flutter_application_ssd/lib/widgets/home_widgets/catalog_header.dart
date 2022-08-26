import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Saarthi: SSD".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        Padding(padding: EdgeInsets.all(10)),
        "Shopping Section".text.xl3.make(),
      ],
    );
  }
}
