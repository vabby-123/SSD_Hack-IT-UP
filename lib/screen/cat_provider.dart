import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider with ChangeNotifier {
  late DocumentSnapshot doc;
  late String selectedCategory;
  List<String> urlList = [];
  Map<String, dynamic> dataToFirestore = {};
  getCategory(selectedCat) {
    this.selectedCategory = selectedCat;
    notifyListeners();
  }

  getCatSnapshot(snapshot) {
    this.doc = snapshot;
    notifyListeners();
  }

  getimages(url) {
    this.urlList.add(url);
    notifyListeners();
  }

  getData(data) {
    this.dataToFirestore = data;
    notifyListeners();
  }
}
