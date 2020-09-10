import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExemploScaffoldWidget extends StatefulWidget {
  @override
  _ExemploScaffoldWidgetState createState() => _ExemploScaffoldWidgetState();
}

class _ExemploScaffoldWidgetState extends State<ExemploScaffoldWidget> {
  int _selectedIndex = 0;

  List<Widget> _myWidget = [
    PageHome(),
    PageSettings(),
    PageA(),
    PageB(),
  ];

  void setPage(int page) {
    setState(() {
      _selectedIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Exemplo'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              //exit(0);
              SystemNavigator.pop();
              // SystemChannels.platform.invokeMapMethod('SystemNavigator.pop');
            },
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        backgroundColor: Colors.redAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Silvo Santos',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              accountEmail: Text(
                'santos@gmail.com',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/9/95/Silvio_Santos_em_maio_de_2019.jpg"),
              ),
              // currentAccountPicture: CircleAvatar(
              //   child: Text(
              //     'S',
              //     style: TextStyle(
              //       fontSize: 40,
              //     ),
              //   ),
              //   backgroundColor: Colors.white,
              // ),
            ),
            ListTile(
              leading: Icon(
                Icons.save,
                size: 30,
              ),
              title: Text(
                'Page A',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              subtitle: Text(
                'Page B',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                print('clique onTap');
                setPage(2);
                Navigator.pop(context);
              },
              onLongPress: () {
                print('clique onLongPress');

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.edit,
                size: 30,
              ),
              title: Text(
                'Page B',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              subtitle: Text(
                'Permite editar',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                print('clique onTap');

                setPage(3);
                Navigator.pop(context);
              },
              onLongPress: () {
                print('clique onLongPress');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.red[200],
        //width: 300,
        //height: 300,
        // child: Center(
        //   child: Text('Page'),
        // ),
        //child: PageHome(),
        width: MediaQuery.of(context).size.width,
        //child: _myWidget.elementAt(_selectedIndex),
        child: _myWidget.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        onTap: (index) {
          print('Index -> $index');
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        selectedFontSize: 20,
        elevation: 25,
      ),
    );
  }
}

class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Page Home',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}

class PageSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Page Settings',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Page A',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Page B',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
