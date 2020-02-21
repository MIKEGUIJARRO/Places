import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {

  final Function onSelectedImage;

  ImageInput({Key key, this.onSelectedImage}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final imageField =
        await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    setState(() {
      _storedImage = imageField;
    });
    //Encontramos una ruta / path disponible para guardar info
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    //Obtenemos el pathString de la foto tomada
    final fileName = path.basename(imageField.path);
    //Copiamos nuestra foto al path especificado (ruta/nombreFoto) y 
    //guardamos el archivo
    final savedImage = await imageField.copy("${appDir.path}/$fileName");
    print("${appDir.path}/$fileName");

    widget.onSelectedImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text(
              "Take Picture",
              textAlign: TextAlign.center,
            ),
            textColor: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
