import 'package:flutter/foundation.dart';
import 'dart:io';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlaces(String pickedTitle, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toIso8601String(),
      image: pickedImage,
      title: pickedTitle,
      location: null,
    );

    _items.add(newPlace);
    notifyListeners();
  }
}