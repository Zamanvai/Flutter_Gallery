import 'dart:io';
import '../helpers/db_helper.dart';
import 'package:flutter/foundation.dart';
import '../models/place.dart';


class UserPlaces with ChangeNotifier {
  List<Place> _item = [];

  List<Place> get items {
    return [..._item];
  }

  void addPlace(String pickedTitle, File pickedImage, ) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: pickedImage,
        title: pickedTitle,
        location: null
    );
    _item.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    },
    );
  }
  Future <void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _item = dataList.map((item) => Place(id:  item['id'], title: item['title'],image: File(item['image']),
    location: null
    ),
    ).toList();
    notifyListeners();
  }
}