import 'package:app_flutter_basic_widget_example/aula_10_image/animal.dart';
import 'package:flutter/material.dart';

class ItemListViewInkWellWidget extends StatelessWidget {
  Animal animal;
  Function onTap;
  Function onDoubleTap;
  Function onLongPress;

  ItemListViewInkWellWidget({
    this.animal,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      splashColor: Colors.blue,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(4),
        color: Colors.red[200],
        child: Stack(
          children: [
            Image.asset(
              animal.url,
              width: MediaQuery.of(context).size.width,
              height: 250,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 50,
              left: 10,
              child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.black87,
                child: Text(
                  animal.nome,
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
