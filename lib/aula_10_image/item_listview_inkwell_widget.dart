import 'package:app_flutter_basic_widget_example/aula_10_image/animal.dart';
import 'package:flutter/material.dart';

class ItemListViewInkWellWidget extends StatelessWidget {
  Animal _animal;
  Function _onTap;
  Function _onDoubleTap;
  Function _onLongPress;

  ItemListViewInkWellWidget(
      {Animal animal,
      Function onTap,
      Function onDoubleTab,
      Function onLongPress}) {
    this._animal = animal;
    this._onTap = onTap;
    this._onDoubleTap = onDoubleTab;
    this._onLongPress = onLongPress;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
      splashColor: Colors.blue,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(4),
        color: Colors.red[200],
        child: Stack(
          children: [
            Image.asset(
              _animal.url,
              width: MediaQuery.of(context).size.width,
              height: 250,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 50,
              left: 10,
              child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.red[200],
                child: Text(
                  _animal.nome,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
