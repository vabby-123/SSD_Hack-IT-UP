import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/flutter_catalog/models/catalog.dart';
import 'package:flutter_application_2/flutter_catalog/widgets/themes.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

//https://gist.githubusercontent.com/vabby-123/267ace0e0cfc4d7ed9b996f784389c95/raw/3758e8658c845215acf15ebad40bf362b35a2453/Catalog.json
  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    //final catalogJson = await rootBundle.loadString("assets/File/catalog.json");
    final catalogJson = await http.get(Uri.parse(
        'https://gist.githubusercontent.com/vabby-123/eea03d27d5c9f4628f3945cb249b3412/raw/5b1b48e75c0b72bc281a200c4c142c96558131ca/catalog2.json'));
    final decodedData = jsonDecode(catalogJson
        .body); //remove .body in case of extracting json file from file
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
