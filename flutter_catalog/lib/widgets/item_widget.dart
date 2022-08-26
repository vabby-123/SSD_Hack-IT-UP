import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: StadiumBorder(),
      child: ListTile(
        //use it inside card to give it great view
        leading: Image.network(item
            .image!), //! is required as we have put datatype as String? which means that it can be null. Therefor to avoid required keyword we have used ?

        title: Text(item.name!),
        trailing: Text("\$${item.price}"),
      ),
    );
  }
}
