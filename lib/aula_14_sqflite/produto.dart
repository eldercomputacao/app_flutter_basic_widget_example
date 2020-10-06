class Produto {
  int id;
  String marca;
  String nome;
  double preco;
  int quantidade;

  Produto({this.id, this.marca, this.nome, this.preco, this.quantidade});

  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marca = json['marca'];
    nome = json['nome'];
    preco = json['preco'];
    quantidade = json['quantidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['marca'] = this.marca;
    data['nome'] = this.nome;
    data['preco'] = this.preco;
    data['quantidade'] = this.quantidade;
    return data;
  }

  @override
  String toString() {
    return '[id: $id, marca: $marca, nome: $nome, preço: $preco, quantidade: $quantidade]';
  }  
}
