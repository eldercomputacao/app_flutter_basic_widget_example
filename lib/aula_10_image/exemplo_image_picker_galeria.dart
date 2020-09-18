// https://medium.com/fabcoding/adding-an-image-picker-in-a-flutter-app-pick-images-using-camera-and-gallery-photos-7f016365d856
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ExemploImagePickerGaleriaWidget extends StatefulWidget {
  @override
  _ExemploImagePickerGaleriaWidgetState createState() =>
      _ExemploImagePickerGaleriaWidgetState();
}

class _ExemploImagePickerGaleriaWidgetState
    extends State<ExemploImagePickerGaleriaWidget> {
  List<File> _images = List<File>();
  ImagePicker _imagePicker = ImagePicker();

  Future getImage() async {
    PickedFile _pickedFile =
        await _imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      File imageFile = File(_pickedFile.path);
      _images.add(imageFile);
      //print('elder - ${_pickedFile.}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo ImagePicker')),
      body: null,
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
