import 'dart:io';

import 'package:flutter/material.dart';

import '../helpers/db_helper.dart';
import '../models/place.dart';
// import 'package:path_provider/path_provider.dart' as syspaths;

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File? pickedImage) async {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      image: pickedImage,
      location: null,
    );
    // final appDir = await syspaths.getApplicationDocumentsDirectory();
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image!.path,
      // 'image': newPlace.image!.path
      //     .substring(appDir.path.length, newPlace.image!.path.length),
    });
  }

  void deletePlace(String id) {
    _items.removeWhere((place) => place.id == id);
    notifyListeners();
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    print(dataList);
    // final appDir = await syspaths.getApplicationDocumentsDirectory();
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            // image: File('${appDir.path}/${item['image']}'),
            location: null,
          ),
        )
        .toList();
    notifyListeners();
  }
}
