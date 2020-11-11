import 'dart:io';
import 'dart:typed_data';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ExemploImagePickerCameraGalleryWidget extends StatefulWidget {
  @override
  _ExemploImagePickerCameraGalleryWidgetState createState() =>
      _ExemploImagePickerCameraGalleryWidgetState();
}

class _ExemploImagePickerCameraGalleryWidgetState
    extends State<ExemploImagePickerCameraGalleryWidget> {
  ImagePicker _imagePicker = ImagePicker();
  File _imageFile;
  Uint8List _imageBytes;
  List<File> _imagesFile = [];

  Future<void> _getImageCamera() async {
    PickedFile file = await _imagePicker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
      //preferredCameraDevice: CameraDevice.front,
    );
    setState(() {
      _imageFile = File(file.path);
      _imagesFile.add(_imageFile);
    });

    file.readAsBytes().then((value) {
      setState(() {
        _imageBytes = value;
      });
    });
  }

  Future<void> _getImageGallery() async {
    PickedFile file = await _imagePicker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      _imageFile = File(file.path);
      _imagesFile.add(_imageFile);
    });

    file.readAsBytes().then((value) {
      setState(() {
        _imageBytes = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exemplo ImagePicker'),
          actions: [
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () => _getImageCamera(),
            ),
            IconButton(
              icon: Icon(Icons.photo),
              onPressed: () => _getImageGallery(),
            )
          ],
        ),
        body: _buildListViewCircularAvatarCameraGallery()
        //body: _buildGridView(),
        //body: _buildCenterFotoSimplesMemory(),
        //body: _buildCenterFotoSimplesFile(),
        );
  }

  ListView _buildListViewCircularAvatarCameraGallery() {
    return ListView(
      children: [
        SizedBox(height: 20),
        CircleAvatar(
          radius: 100,
          child: _imageFile == null
              ? Text('sem foto')
              : ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    _imageFile,
                    width: 200,
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
        ),
      ],
    );
  }

  GridView _buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      children: _imagesFile
          .map((img) => Container(
                padding: EdgeInsets.all(2),
                color: Colors.red[200],
                child: Image.file(
                  img,
                  fit: BoxFit.fill,
                ),
              ))
          .toList(),
    );
  }

  Center _buildCenterFotoSimplesFile() {
    return Center(
      child: Container(
        child: _imageFile == null
            ? Text(
                'Sem foto',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                ),
              )
            : Image.file(
                _imageFile,
                height: 300,
                //fit: BoxFit.fill,
              ),
      ),
    );
  }

  Center _buildCenterFotoSimplesMemory() {
    return Center(
      child: Container(
        child: _imageBytes == null
            ? Text(
                'Sem foto',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                ),
              )
            : Image.memory(
                _imageBytes,
                height: 300,
                //fit: BoxFit.fill,
              ),
      ),
    );
  }
}
