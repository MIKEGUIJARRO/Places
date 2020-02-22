import 'package:flutter/material.dart';
import 'dart:io';

import '../widgets/image_input.dart';
import '../providers/great_places.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/add-place";
  AddPlaceScreen({Key key}) : super(key: key);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() { 
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlaces(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a New Place"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "Title"),
                      controller: _titleController,
                    ),
                    SizedBox(height: 10),
                    ImageInput(
                      onSelectedImage: _selectImage,
                    ),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.add),
            label: Text("Add Place"),
            onPressed: _savePlace
          )
        ],
      ),
    );
  }
}
