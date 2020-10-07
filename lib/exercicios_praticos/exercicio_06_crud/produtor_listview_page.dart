import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_06_crud/produto.dart';
import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_06_crud/produto_page.dart';
import 'package:flutter/material.dart';

class ProdutoListViewPage extends StatefulWidget {
  @override
  _ProdutoListViewPageState createState() => _ProdutoListViewPageState();
}

class _ProdutoListViewPageState extends State<ProdutoListViewPage> {
  List<Produto> _produtos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
        centerTitle: true,
      ),
      body: _listView(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add_circle),
      onPressed: () {
        _savandoProduto();
      },
    );
  }

  _savandoProduto() async {
    Produto produtoResultado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return ProdutoPage();
      }),
    );

    if (produtoResultado != null) {
      setState(() {
        _produtos.add(produtoResultado);
      });
    }
  }

  _editandoProduto(Produto produto, int i) async {
    Produto produtoResultado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return ProdutoPage(produto: produto);
      }),
    );

    if (produtoResultado != null) {
      setState(() {
        _produtos[i] = produtoResultado;
      });
    }
  }

  _deletandoProduto(int i) {
    setState(() {
      _produtos.removeAt(i);
    });
  }

  Widget _listView() {
    return _produtos.length <= 0
        ? Container(
            child: Center(
              child: Text('Lista Vazia'),
            ),
          )
        : ListView.builder(
            itemCount: _produtos.length,
            itemBuilder: (BuildContext context, int i) {
              return ListTile(
                title: Text('${_produtos[i].nome}'),
                subtitle: Text('${_produtos[i].marca}'),
                trailing: Text('${_produtos[i].preco}'),
                onTap: () {
                  _editandoProduto(_produtos[i], i);
                },
                onLongPress: () {
                  _deletandoProduto(i);
                },
              );
            },
          );
  }
}
