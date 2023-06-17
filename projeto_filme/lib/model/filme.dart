class Filme {
  int id;
  String urlImagem;
  String titulo;
  String genero;
  String faixaEtaria;
  int duracao;
  double nota;
  int ano;
  String descricao;
  Filme(this.urlImagem, this.titulo, this.genero, this.faixaEtaria,
      this.duracao, this.nota, this.ano, this.descricao,
      {this.id = 0});

  Map<String, dynamic> toMap() {
    return {
      "imageUrl": urlImagem,
      "titulo": titulo,
      "genero": genero,
      "faixaEtaria": faixaEtaria,
      "duracao": duracao,
      "nota": nota,
      "descricao": descricao,
      "ano": ano,
    };
  }

  @override
  String toString() {
    return 'Filme{id: $id, titulo: $titulo}';
  }
}
