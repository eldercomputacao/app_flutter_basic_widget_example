import 'package:app_flutter_basic_widget_example/aula_14_sqflite/produto.dart';
import 'package:app_flutter_basic_widget_example/aula_14_sqflite/produto_dao.dart';
import 'package:flutter/material.dart';

class ExemploListViewProdutos extends StatefulWidget {
  @override
  _ExemploListViewProdutosState createState() =>
      _ExemploListViewProdutosState();
}

class _ExemploListViewProdutosState extends State<ExemploListViewProdutos> {
  _testeCriacaoBanco() async {
    await ProdutoDAO().db;
  }

  _testeInserirProdutos() {
    List<Produto> produtos = [
      Produto(
        marca: 'Rexona',
        nome: 'Sabonete Barra',
        preco: 1.6,
        quantidade: 10,
      ),
      Produto(
        marca: 'Rexona',
        nome: 'Sabonete Liquido',
        preco: 5.6,
        quantidade: 20,
      ),
      Produto(
        marca: 'Crystal',
        nome: 'Agua com gás',
        preco: 1.49,
        quantidade: 30,
      ),
      Produto(
        marca: 'Massa Massa',
        nome: 'Macarrão',
        preco: 2.6,
        quantidade: 12,
      ),
    ];

    produtos.forEach((p) async {
      await ProdutoDAO().inserir(p);
    });
  }

  _testeInserirProdutos2() {
    List<Produto> produtos = [
      Produto(
        marca: 'Rexona',
        nome: 'Sabonete Barra',
        preco: 1.6,
        quantidade: 10,
      ),
      Produto(
        marca: 'Rexona',
        nome: 'Sabonete Liquido',
        preco: 5.6,
        quantidade: 20,
      ),
      Produto(
        marca: 'Crystal',
        nome: 'Agua com gás',
        preco: 1.49,
        quantidade: 30,
      ),
      Produto(
        marca: 'Massa Massa',
        nome: 'Macarrão',
        preco: 2.6,
        quantidade: 12,
      ),
    ];

    produtos.forEach((p) async {
      await ProdutoDAO().inserir2(p);
    });
  }

  _testeListaProdutos() async {
    List<Produto> produtos = await ProdutoDAO().listarTodos();
    produtos.forEach((p) => print(p));
  }

  _testeListaProdutos2() async {
    List<Produto> produtos = await ProdutoDAO().listarTodos2();
    produtos.forEach((p) => print(p));
  }

  _testeBuscaProdutoId() async {
    Produto produto = await ProdutoDAO().buscarProdutoId(5);
    print('Busca Produto Id: $produto');
  }

  _testeBuscaProdutoId2() async {
    Produto produto = await ProdutoDAO().buscarProdutoId2(5);
    print('Busca Produto Id: $produto');
  }

  _testeProdutosQuantidade() async {
    int quantidade = await ProdutoDAO().buscarQuantidade();
    print('Quantidade Produtos: $quantidade');
  }

  _testeProdutoExiste() async {
    bool existe = await ProdutoDAO().produtoExiste(71);
    print('Produto: $existe');
  }

  _testeAtualizaProduto() async {
    Produto produto = Produto(
      id: 4,
      marca: 'marca atualizada 4',
      nome: 'nome atualizada 4',
      preco: 44,
      quantidade: 4,
    );
    int result = await ProdutoDAO().atualizar(produto);
    print('quant atualizado: $result');
  }

  _testeAtualizaProduto2() async {
    Produto produto = Produto(
      id: 5,
      marca: 'marca atualizada 5',
      nome: 'nome atualizada 5',
      preco: 55,
      quantidade: 55,
    );
    int result = await ProdutoDAO().atualizar2(produto);
    print('quant atualizado: $result');
  }

  _testeDeleleProduto() async {
    int result = await ProdutoDAO().delete(1);
    print('delete: $result');
  }

  _testeDeleleProduto2() async {
    int result = await ProdutoDAO().delete2(2);
    print('delete: $result');
  }

  _testeDeleteTodosProdutos() async {
    int result = await ProdutoDAO().deleteTodos();
    print('delete todos: $result');
  }

  _testeDeleteTodosProdutos2() async {
    int result = await ProdutoDAO().deleteTodos2();
    print('delete todos: $result');
  }

  @override
  Widget build(BuildContext context) {
    // _testeCriacaoBanco();

    // _testeInserirProdutos();
    // _testeInserirProdutos2();

    // _testeListaProdutos();
    _testeListaProdutos2();

    // _testeBuscaProdutoId();
    // _testeBuscaProdutoId2();

    // _testeProdutosQuantidade();
    // _testeProdutoExiste();

    // _testeAtualizaProduto();
    // _testeAtualizaProduto2();

    // _testeDeleleProduto();
    // _testeDeleleProduto2();

    //_testeDeleteTodosProdutos();
    //_testeDeleteTodosProdutos2();

    //_testeListaProdutos();

    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
