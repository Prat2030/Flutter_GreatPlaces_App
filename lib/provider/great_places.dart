import 'package:flutter/material.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items => [..._items];
  // void addPlace(String title, String imageUrl, String location) {
  //   final newPlace = Place(
  //     id: DateTime.now().toString(),
  //     title: title,
  //     image: imageUrl,
  //     location: location,
  //   );
  //   _items.add(newPlace);
  //   notifyListeners();
  // }
  // void deletePlace(String id) {
  //   _items.removeWhere((place) => place.id == id);
  //   notifyListeners();
  // }
}
