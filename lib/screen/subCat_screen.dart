import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../authentication/FirebaseService.dart';

class SubCatList extends StatelessWidget {
  static const String id = 'subCat-screen';
  @override
  Widget build(BuildContext context) {
    Object? args = ModalRoute.of(context)!.settings.arguments;
    FirebaseService _service = FirebaseService();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ), //AppBar
      body: Container(
        child: FutureBuilder<DocumentSnapshot>(
          future: _service.categories.doc(args.toString()).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Container();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var data = snapshot.data!['subcat'];
            return Container(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        data[index],
                        style: TextStyle(fontSize: 15),
                      ),
                    ), //ListTile
                  ); //padding
                },
              ), //listview
            ); //Container
          },
        ), // Futurebuilder
      ), //container
    ); //scaffold
  }
}
