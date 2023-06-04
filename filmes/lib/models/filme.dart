class Filme {
  int id;
  String urlImagem;
  String titulo;
  String genero;
  String faixaEtaria;
  String duracao;
  double nota;
  int ano;
  String descricao;
  Filme(this.urlImagem, this.titulo, this.genero, this.faixaEtaria,
      this.duracao, this.nota, this.ano, this.descricao,
      {this.id = 0});
}
