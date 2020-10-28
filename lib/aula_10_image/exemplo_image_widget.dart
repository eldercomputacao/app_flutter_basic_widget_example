import 'package:app_flutter_basic_widget_example/aula_10_image/animal.dart';
import 'package:app_flutter_basic_widget_example/aula_10_image/animal_api.dart';
import 'package:app_flutter_basic_widget_example/aula_10_image/item_listview_gesturedetector_widget.dart';
import 'package:app_flutter_basic_widget_example/aula_10_image/item_listview_inkwell_widget.dart';
import 'package:flutter/material.dart';

class ExemploImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Imagens')),
      body: _listViewItemPersonalizado2(),
      //body: _listViewItemPersonalizado(),
      //body: _imageFundoTela(context),
      //body: _imageNetwork(context),
      //body: _imageAsset(context),
    );
  }

  ListView _listViewItemPersonalizado() {
    List<Animal> animais = AnimalAPI.getAnimais();
    return ListView.builder(
      itemCount: animais.length,
      itemBuilder: (context, i) {
        return ItemListViewInkWellWidget(
          animal: animais[i],
          onTap: () => print('${animais[i].nome} - onTap'),
          onDoubleTap: () => print('${animais[i].nome} - onDoubleTap'),
          onLongPress: () => print('${animais[i].nome} - onLongPress'),
        );
      },
    );
  }

  ListView _listViewItemPersonalizado2() {
    List<Animal> animais = AnimalAPI.getAnimais();
    return ListView.builder(
      itemCount: animais.length,
      itemBuilder: (context, i) {
        return ItemListViewGestoreDetectorWidget(
          animal: animais[i],
          onTap: () => print('${animais[i].nome} - onTap'),
          onDoubleTap: () => print('${animais[i].nome} - onDoubleTap'),
          onLongPress: () => print('${animais[i].nome} - onLongPress'),
        );
      },
    );
  }

  Stack _imageFundoTela(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "resource/image/plano-claro.png",
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        ListView(
          padding: EdgeInsets.all(10),
          children: [
            Icon(
              Icons.people,
              size: 160,
              color: Colors.red[300],
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.red[100],
                filled: true,
                labelText: 'Login',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.red[100],
                filled: true,
                labelText: 'Senha',
              ),
              obscureText: true,
              obscuringCharacter: '@',
            ),
            SizedBox(height: 20),
            Container(
              height: 55,
              child: RaisedButton(
                child: Text(
                  'Entrar',
                  style: TextStyle(),
                ),
                onPressed: () {},
                //color: Colors.black87,
              ),
            )
          ],
        )
      ],
    );
  }

  Container _imageNetwork(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      padding: EdgeInsets.all(5),
      color: Colors.red[200],
      child: Image.network(
        'https://s2.glbimg.com/slaVZgTF5Nz8RWqGrHRJf0H1PMQ=/0x0:800x450/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2019/U/e/NTegqdSe6SoBAoQDjKZA/cachorro.jpg',
        // fit: BoxFit.fill,
      ),
    );
  }

  Container _imageAsset(BuildContext context) {
    //fit: permite redimencionar a imagem de acordo com o layout disponivel
    //BoxFit.none, // a imagem não é redimencionada, a imagem fica centralizada no layout
    //BoxFit.fill, // a imagem é redimencionada, preenchendo o espeço disponivel na altura e na largura do layout
    //BoxFit.fitWidth, // a imagem é redimencionada, preenchendo o espeço disponivel na largura do layout
    //BoxFit.fitHeight, // a imagem é redimencionada, preenchendo o espeço disponivel na altura do layout
    //BoxFit.contain, // a imagem é redimencionada até preencher alguma dimensão do layout, esse argumento não permite perda de qualidade na imagem
    //BoxFit.cover, // a imagem é redimencionada, preenchendo todo espeço disponivel do layout, esse argumento pode resultar em perda de qualidade na imagem
    //BoxFit.scaleDown, // parecido com 'none'
    print('construido');
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      padding: EdgeInsets.all(5),
      color: Colors.red[200],
      child: Image.asset(
        "resource/image/image-flutter.png",
        //fit: BoxFit.none,
        //fit: BoxFit.fill,
        //fit: BoxFit.fitWidth,
        //fit: BoxFit.fitHeight,
        //fit: BoxFit.contain,
        //fit: BoxFit.cover,
        //fit: BoxFit.scaleDown,
        //alignment: Alignment.topRight,
        //color: Colors.transparent,
        //repeat: ImageRepeat.repeat,
        // width: 70,
        // height: 70,
      ),
    );
  }
}
