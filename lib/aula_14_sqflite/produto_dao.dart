import 'package:app_flutter_basic_widget_example/aula_14_sqflite/database_helper_estoque.dart';
import 'package:app_flutter_basic_widget_example/aula_14_sqflite/produto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class ProdutoDAO {
  Future<Database> get db => DatabaseHelperEstoque.instancia.db;

  Future<int> inserir(Produto produto) async {
    Database dbCliente = await db;
    return await dbCliente.insert('produtos', produto.toJson());
  }

  Future<int> inserir2(Produto produto) async {
    Database dbCliente = await db;
    String sql = '''
      INSERT INTO produtos (marca, nome, preco, quantidade) 
      VALUES (?, ?, ?, ?)
    ''';
    return await dbCliente.rawInsert(sql, [
      produto.marca,
      produto.nome,
      produto.preco,
      produto.quantidade,
    ]);
  }

  Future<List<Produto>> listarTodos() async {
    Database dbCliente = await db;
    List<Map<String, dynamic>> maps = await dbCliente.query('produtos');
    return maps.map((e) => Produto.fromJson(e)).toList();
  }

  Future<List<Produto>> listarTodos2() async {
    Database dbCliente = await db;
    String sql = 'SELECT * FROM produtos';
    List<Map<String, dynamic>> maps = await dbCliente.rawQuery(sql);
    return maps.map((e) => Produto.fromJson(e)).toList();
  }

  Future<Produto> buscarProdutoId(int id) async {
    Database dbCliente = await db;
    List<Map<String, dynamic>> maps =
        await dbCliente.query('produtos', where: 'id = ?', whereArgs: [id]);

    if (maps.length > 0) {
      return Produto.fromJson(maps.elementAt(0));
    }

    return null;
  }

  Future<Produto> buscarProdutoId2(int id) async {
    Database dbCliente = await db;
    String sql = 'SELECT * FROM produtos WHERE id = ?';
    List<Map<String, dynamic>> maps = await dbCliente.rawQuery(sql, [id]);

    if (maps.length > 0) {
      return Produto.fromJson(maps.elementAt(0));
    }

    return null;
  }

  Future<int> buscarQuantidade() async {
    Database dbCliente = await db;
    final resultSet = await dbCliente.rawQuery('SELECT COUNT(*) FROM produtos');
    print('runtimeType: ${resultSet.runtimeType}');
    return Sqflite.firstIntValue(resultSet);
  }

  Future<bool> produtoExiste(int id) async {
    Produto produto = await buscarProdutoId(id);
    return (produto != null);
  }

  Future<int> atualizar(Produto produto) async {
    Database dbCliente = await db;
    return await dbCliente.update(
      'produtos',
      produto.toJson(),
      where: 'id = ?',
      whereArgs: [produto.id],
    );
  }

  Future<int> atualizar2(Produto produto) async {
    Database dbCliente = await db;
    String sql = '''UPDATE produtos 
           SET 
           marca = ?, 
           nome = ?, 
           preco = ?, 
           quantidade = ? WHERE id = ?''';
    return await dbCliente.rawUpdate(sql, [
      produto.marca,
      produto.nome,
      produto.preco,
      produto.quantidade,
      produto.id,
    ]);
  }

  Future<int> delete(int id) async {
    Database dbCliente = await db;
    return await dbCliente.delete('produtos', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete2(int id) async {
    Database dbCliente = await db;
    return await dbCliente.rawDelete('DELETE FROM produtos WHERE id = ?', [id]);
  }

  Future<int> deleteTodos() async {
    Database dbCliente = await db;
    return await dbCliente.delete('produtos');
  }

  Future<int> deleteTodos2() async {
    Database dbCliente = await db;
    return await dbCliente.rawDelete('DELETE FROM produtos');
  }
}
