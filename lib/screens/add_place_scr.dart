import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/image_input.dart';
import 'package:provider/provider.dart';
import '../provider/user_places.dart';
import '../widgets/location_input.dart';

class AddPlaceScr extends StatefulWidget {
  static var routeName =  '/add-place';

  @override
  _AddPlaceScrState createState() => _AddPlaceScrState();
}

class _AddPlaceScrState extends State<AddPlaceScr> {
  final _titleController= TextEditingController();
  File _pickedImage;
  
  void _selectImage(File pickedImage){
  _pickedImage = pickedImage;
  }

  void _savePlace() {
    if(_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<UserPlaces>(context, listen: false).
    addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new place'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget> [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title') ,
                    controller: _titleController,
                  ),
                  SizedBox(height: 10,),
                  ImageInput(_selectImage),
                  SizedBox(height: 10,),
                  LocationInput(),
                ],
              ),
            ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
          label: Text('Add a place'),
            onPressed: _savePlace,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
