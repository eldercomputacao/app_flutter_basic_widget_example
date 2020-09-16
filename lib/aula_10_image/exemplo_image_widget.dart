import 'package:flutter/material.dart';

class ExemploImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Imagens')),
      body: _imageFundoTela(context),
      //body: _imageNetwork(context),
      //body: _imageAsset(context),
    );
  }

  Stack _imageFundoTela(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "resource/image/plano-claro.png",
          fit: BoxFit.fill,
          //height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  labelText: 'Nome',
                ),
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.red[100],
                  filled: true,
                  labelText: 'Email',
                ),
              ),
            ],
          ),
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
        //fit: BoxFit.fill,
      ),
    );
  }

  Container _imageAsset(BuildContext context) {
    //fit: permite redimencionar a imagem de acordo com o layout disponivel
    //BoxFit.none, // a imagem não é redimencionada
    //BoxFit.scaleDown, // parecido com 'none'
    //BoxFit.fill, // a imagem é redimencionada preenchendo o espeço disponivel no layout
    //BoxFit.fitWidth, // a imagem é redimencionada preenchendo o espeço disponivel na largura do layout
    //BoxFit.fitHeight, // a imagem é redimencionada preenchendo o espeço disponivel na altura layout
    //BoxFit.contain, // a imagem é redimencionada até preencher alguma dimensão no layout, com essa opção não ocorre perda de qualidade na imagem
    //BoxFit.cover, // a imagem é redimencionada preenchendo o espeço disponivel no layout, com essa opção pode ocorrer perda qualidade na imagem
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
        //alignment: Alignment.center,
        //color: Colors.transparent,
        //repeat: ImageRepeat.repeat,
      ),
    );
  }
}
