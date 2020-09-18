import 'package:flutter/material.dart';

class ExemploGridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildGridViewCountDinamico(),
      //body: _buildGridViewCountEstatico(),
    );
  }

  GridView _buildGridViewCountDinamico() {
    return GridView.count(
      crossAxisCount: 3,
      children: itens.map((item) => ItemCard(item: item)).toList(),
    );
  }

  GridView _buildGridViewCountEstatico() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      padding: EdgeInsets.all(4),
      reverse: false,
      scrollDirection: Axis.vertical,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Text("He'd have you all unravel at the"),
          color: Colors.teal[100],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text("He'd have you all unravel at the"),
          color: Colors.teal[200],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text("He'd have you all unravel at the"),
          color: Colors.teal[300],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text("He'd have you all unravel at the"),
          color: Colors.teal[400],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text("He'd have you all unravel at the"),
          color: Colors.teal[500],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text("He'd have you all unravel at the"),
          color: Colors.teal[600],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text("He'd have you all unravel at the"),
          color: Colors.teal[700],
        ),
      ],
    );
  }
}

class Item {
  String titulo;
  IconData icon;

  Item({this.titulo, this.icon});
}

List<Item> itens = <Item>[
  Item(titulo: 'Carro', icon: Icons.directions_car),
  Item(titulo: 'Bike', icon: Icons.directions_bike),
  Item(titulo: 'Barco', icon: Icons.directions_boat),
  Item(titulo: 'Ônibux', icon: Icons.directions_bus),
  Item(titulo: 'Trem', icon: Icons.directions_railway),
  Item(titulo: 'Andar', icon: Icons.directions_walk),
  Item(titulo: 'Carro', icon: Icons.directions_car),
  Item(titulo: 'Bike', icon: Icons.directions_bike),
  Item(titulo: 'Barco', icon: Icons.directions_boat),
  Item(titulo: 'Ônibux', icon: Icons.directions_bus),
  Item(titulo: 'Trem', icon: Icons.directions_railway),
  Item(titulo: 'Andar', icon: Icons.directions_walk),
  Item(titulo: 'Carro', icon: Icons.directions_car),
  Item(titulo: 'Bike', icon: Icons.directions_bike),
  Item(titulo: 'Barco', icon: Icons.directions_boat),
  Item(titulo: 'Ônibux', icon: Icons.directions_bus),
  Item(titulo: 'Trem', icon: Icons.directions_railway),
  //Item(titulo: 'Andar', icon: Icons.directions_walk),
];

class ItemCard extends StatelessWidget {
  Item item;
  ItemCard({this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(item.icon, size: 80.0),
            Text(item.titulo),
          ],
        ),
      ),
    );
  }
}
