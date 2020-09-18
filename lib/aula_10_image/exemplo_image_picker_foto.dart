import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ExemploImagePickerFotoWidget extends StatefulWidget {
  @override
  _ExemploImagePickerFotoWidgetState createState() =>
      _ExemploImagePickerFotoWidgetState();
}

class _ExemploImagePickerFotoWidgetState
    extends State<ExemploImagePickerFotoWidget> {
  File _imageFile;
  ImagePicker _imagePicker = ImagePicker();

  Future getImage() async {
    PickedFile _pickedFile = await _imagePicker.getImage(
      source: ImageSource.camera,
      //maxHeight: 300,
      maxWidth: 300,
      preferredCameraDevice: CameraDevice.rear,
    );

    setState(() {
      _imageFile = File(_pickedFile.path);
      //print('elder - ${_pickedFile.}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo ImagePicker'),
      ),
      body: Center(
        child: Container(
          //color: Colors.red[200],
          padding: EdgeInsets.all(10),
          child: (_imageFile == null)
              ? Text('Nenhum imagem selecionada')
              : Image.file(_imageFile),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          CupertinoIcons.photo_camera_solid,
          size: 35,
        ),
        onPressed: () => getImage(),
      ),
    );
  }
}
