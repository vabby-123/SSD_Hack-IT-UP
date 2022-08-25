import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import '../themes.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Saarthi: SSD".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        Padding(padding: EdgeInsets.all(10)),
        Row(children: [
          "Shopping Section".text.xl3.make(),
          Padding(padding: EdgeInsets.only(left: 76)),
          ElevatedButton(onPressed: () {}, child: Text('Sell')),
        ]),
      ],
    );
  }
}
