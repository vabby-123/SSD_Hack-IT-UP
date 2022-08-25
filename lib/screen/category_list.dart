import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/screen/subCat_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../authentication/FirebaseService.dart';

class CategoryListScreen extends StatelessWidget {
  static const String id = 'category-list-screen';
  @override
  Widget build(BuildContext context) {
    FirebaseService _service = FirebaseService();

    var futureBuilder = FutureBuilder<QuerySnapshot>(
      future: _service.categories.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Container();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              var doc = snapshot.data!.docs[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    //sub categories
                    if (doc['subCat'] == null) {
                      return print('No sub Categories');
                    }
                    Navigator.pushNamed(context, SubCatList.id, arguments: doc);
                  },
                  leading: Image.network(
                    doc["image"],
                    width: 40,
                  ),
                  title: Text(
                    doc['catName'],
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  ),
                ), //ListTile
              ); //padding
            },
          ), //listview
        ); //Container
      },
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ), //AppBar
      body: Container(
        child: futureBuilder, // Futurebuilder
      ), //Container
    ); //Scaffold
  }
}
