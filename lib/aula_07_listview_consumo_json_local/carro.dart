class Carro {
  int id;
  String nome;
  String descricao;
  double preco;
  String image;
  List<String> fones;

  Carro({
    this.id,
    this.nome,
    this.descricao,
    this.preco,
    this.image,
    this.fones,
  });

  Carro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    preco = json['preco'];
    image = json['image'];
    fones = json['fones'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['preco'] = this.preco;
    data['image'] = this.image;
    data['fones'] = this.fones;
    return data;
  }

  @override
  String toString() {
    return " # Nome: $nome, \nDesc: $descricao, \nPreço: $preco, \nImage: $image, \nFones: $fones";
  }
}
