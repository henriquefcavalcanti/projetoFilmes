import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projeto_filme/dao/filme_dao.dart';
import 'package:projeto_filme/model/filme.dart';
import 'package:projeto_filme/utils/app_rotas.dart';

const List<String> faixaEtariaList = <String>[
  "Livre",
  "10",
  "12",
  "14",
  "16",
  "18"
];

class EditarFilmeTela extends StatefulWidget {
  // final Filme filme;

  @override
  EditarFilmeTelaState createState() => EditarFilmeTelaState();
}

class EditarFilmeTelaState extends State<EditarFilmeTela> {
  FilmeDao filmeDao = FilmeDao();

  TextEditingController edtUrlImagem = TextEditingController();
  TextEditingController edtTitulo = TextEditingController();
  TextEditingController edtGenero = TextEditingController();
  TextEditingController edtDuracao = TextEditingController();
  TextEditingController edtAno = TextEditingController();
  TextEditingController edtDescricao = TextEditingController();
  int filmeID = 0;
  final _formState = GlobalKey<FormState>();

  String dropdownValueFaixaEtaria = ""; //faixaEtariaList.first;

  double nota = 0;

  void _atualizarFilme() {
    Filme filmeAtualizacao = Filme(
        edtUrlImagem.text,
        edtTitulo.text,
        edtGenero.text,
        '',
        int.parse(edtDuracao.text),
        nota,
        int.parse(edtAno.text),
        edtDescricao.text,
        id: filmeID);

    FilmeDao filmeDao = FilmeDao();
    filmeDao.update(filmeAtualizacao);

    Navigator.of(context).pushNamed(
      AppRoutes.HOME,
    );
  }

  @override
  Widget build(BuildContext context) {
    Filme filme = ModalRoute.of(context)!.settings.arguments as Filme;
    edtUrlImagem.text = filme.urlImagem;
    edtTitulo.text = filme.titulo;
    edtGenero.text = filme.genero;
    dropdownValueFaixaEtaria = filme.faixaEtaria;
    edtDuracao.text = filme.duracao.toString();
    nota = filme.nota;
    edtDescricao.text = filme.descricao;
    edtAno.text = filme.ano.toString();
    filmeID = filme.id;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formState,
          child: Column(
            children: [
              TextFormField(
                controller: edtUrlImagem,
                decoration: const InputDecoration(labelText: 'URL da Imagem'),
              ),
              TextFormField(
                controller: edtTitulo,
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              TextFormField(
                controller: edtGenero,
                decoration: const InputDecoration(labelText: 'Gênero'),
              ),
              Row(
                children: [
                  const Text(
                    "Faixa Etária:    ",
                    // style: TextStyle(fontSize: 20),
                  ),
                  DropdownButton<String>(
                    value: dropdownValueFaixaEtaria,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        print(value);
                        dropdownValueFaixaEtaria = value!;
                      });
                    },
                    items: faixaEtariaList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              TextFormField(
                controller: edtDuracao,
                decoration: const InputDecoration(labelText: 'Duração (Minutos)'),
                keyboardType: TextInputType.number,
              ),
              Row(
                children: [
                  const Text("Nota:   "),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: RatingBar.builder(
                      initialRating: nota,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        nota = rating;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: edtAno,
                decoration: const InputDecoration(labelText: 'Ano'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: edtDescricao,
                decoration: const InputDecoration(labelText: 'Descrição'),
                maxLines: 3,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _atualizarFilme,
                child: const Text('Atualizar Filme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
