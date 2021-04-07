import 'package:app_flutter_basic_widget_example/aula_06_listView/pessoa.dart';
import 'package:app_flutter_basic_widget_example/aula_06_listView/pessoa_api.dart';
import 'package:flutter/material.dart';

class ExemplosListWidget extends StatelessWidget {
  List<String> cidadesPb2 = [];
  List<String> cidadesPb = [
    'Patos',
    'Cajazeiras',
    'Sousa',
    'Camapina Grande',
    'Jampa',
    'Patos',
    'Cajazeiras',
    'Sousa',
    'Camapina Grande',
    'Jampa',
    'Patos',
    'Cajazeiras',
    'Sousa',
    'Camapina Grande',
    'Jampa',
    'Patos',
    'Cajazeiras',
    'Sousa',
    'Camapina Grande',
    'Jampa',
    'Patos',
    'Cajazeiras',
    'Sousa',
    'Camapina Grande',
    'Jampa',
    'Patos',
    'Cajazeiras',
    'Sousa',
    'Camapina Grande',
    'Jampa',
    'Patos',
    'Cajazeiras',
    'Sousa',
    'Camapina Grande',
    'Jampa'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //body: _buildListViewPessoa(),
      //body: _buildListViewHorizontal(),
      body: _buildListViewInfinite(),
      //body: _testeListaVazia(context),
      //body: _buildListViewSeparetedDinamico(),
      //body: _buildListViewBuilderDinamico(),
      //body: _buildListViewEstaticoDivideTiles(context),
      //body: _buildListViewEstatico(),
    );
  }

  ListView _buildListViewPessoa() {
    List<Pessoa> pessoas = PessoaApi.getPessos();

    return ListView.builder(
      itemCount: pessoas.length,
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          title: Text('${pessoas[i].nome}'),
          subtitle: Text('${pessoas[i].telefone}'),
          trailing: Icon(
            Icons.favorite,
            color: pessoas.elementAt(i).favorito ? Colors.redAccent : null,
            size: pessoas[i].favorito ? 30 : null,
          ),
        );
      },
    );
  }

  Widget _buildListViewHorizontal() {
    return Container(
      //height: 150,
      child: ListView(
        //cacheExtent: 0,
        padding: EdgeInsets.all(4),
        scrollDirection: Axis.vertical,
        children: [
          Container(
            color: Colors.red[200],
            height: 150,
            width: 150,
            child: Center(
              child: Text(
                'Item A',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.green[200],
            height: 150,
            width: 150,
            child: Center(
              child: Text(
                'Item B',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.blue[200],
            height: 150,
            width: 150,
            child: Center(
              child: Text(
                'Item C',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.yellow[200],
            height: 150,
            width: 150,
            child: Center(
              child: Text(
                'Item D',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.purple[200],
            height: 150,
            width: 150,
            child: Center(
              child: Text(
                'Item E',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.pink[200],
            height: 150,
            width: 150,
            child: Center(
              child: Text(
                'Item F',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            height: 150,
            width: 150,
            child: Center(
              child: Text(
                'Item G',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          //TextField(),
        ],
      ),
    );
  }

  ListView _buildListViewInfinite() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          title: Text('Index: $i'),
        );
      },
      //physics: NeverScrollableScrollPhysics(),
      //physics: AlwaysScrollableScrollPhysics(),
      //reverse: true,
      //addAutomaticKeepAlives: true,
      //addRepaintBoundaries: true,
      cacheExtent: 100,
    );
  }

  Widget _testeListaVazia(BuildContext context) {
    //cidadesPb.clear();
    return (cidadesPb2.length > 0)
        ? _buildListViewBuilderDinamico()
        : Container(
            child: Center(
              child: Text('Lista Vazia!', style: TextStyle(fontSize: 30)),
            ),
          );
  }

  ListView _buildListViewSeparetedDinamico() {
    return ListView.separated(
      itemCount: cidadesPb.length,
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          title: Text(cidadesPb[i]),
        );
      },
      separatorBuilder: (BuildContext context, int i) => Divider(
        color: Colors.red[200],
        thickness: 1,
      ),
      // separatorBuilder: (BuildContext contenxt, int i) => Container(
      //   height: 20,
      //   color: Colors.red,
      //   child: Text('Item $i'),
      //   margin: EdgeInsets.symmetric(horizontal: 15),
      //   padding: EdgeInsets.all(2),
      // ),
    );
  }

  ListView _buildListViewBuilderDinamico() {
    return ListView.builder(
      itemCount: cidadesPb.length,
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          title: Text(cidadesPb[i]),
        );
      },
    );
  }

  ListView _buildListViewEstaticoDivideTiles(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        // método estatico
        context: context,
        color: Colors.redAccent,
        tiles: [
          ListTile(
            leading: Icon(Icons.save),
            title: Text('Salvar'),
            subtitle: Text('Permite salvar itens'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
            onLongPress: () {},
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Editar'),
            subtitle: Text('Permite fazer edições'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
            onLongPress: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            trailing: Icon(Icons.arrow_forward_ios),
            subtitle: Text('Permite sair do app'),
            onTap: () {},
            onLongPress: () {},
          ),
        ],
      ).toList(),
    );
  }

  ListView _buildListViewEstatico() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      children: [
        ListTile(
          leading: Icon(Icons.save),
          title: Text('Salvar'),
          subtitle: Text('Permite salvar itens'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
          onLongPress: () {},
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Editar'),
          subtitle: Text('Permite fazer edições'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
          onLongPress: () {},
        ),
        Divider(
          color: Colors.red,
          height: 30,
          thickness: 2,
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Sair'),
          trailing: Icon(Icons.arrow_forward_ios),
          subtitle: Text('Permite sair do app'),
          onTap: () {},
          onLongPress: () {},
        ),
      ],
    );
  }
}
