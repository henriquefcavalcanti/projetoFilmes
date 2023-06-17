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

class CadastrarFilme extends StatefulWidget {
  const CadastrarFilme({Key? key}) : super(key: key);

  @override
  State<CadastrarFilme> createState() => _CadastrarFilmeState();
}

class _CadastrarFilmeState extends State<CadastrarFilme> {
  FilmeDao filmeDao = FilmeDao();

  TextEditingController edtUrlImagem = TextEditingController();
  TextEditingController edtTitulo = TextEditingController();
  TextEditingController edtGenero = TextEditingController();
  TextEditingController edtDuracao = TextEditingController();
  TextEditingController edtAno = TextEditingController();
  TextEditingController edtDescricao = TextEditingController();
  final _formState = GlobalKey<FormState>();

  String dropdownValueFaixaEtaria = faixaEtariaList.first;
  double nota = 0;

  void _salvarCadastro() {
    Filme filme = Filme(
      edtUrlImagem.text,
      edtTitulo.text,
      edtGenero.text,
      dropdownValueFaixaEtaria,
      int.parse(edtDuracao.text),
      nota,
      int.parse(edtAno.text),
      edtDescricao.text,
    );

    filmeDao.save(filme);

    Navigator.of(context).pushNamed(
      AppRoutes.HOME,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Filme"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _formState,
            child: Column(
              children: [
                TextFormField(
                  controller: edtUrlImagem,
                  decoration: const InputDecoration(labelText: "URL Imagem"),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  controller: edtTitulo,
                  decoration: const InputDecoration(labelText: "Título"),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  controller: edtGenero,
                  decoration: const InputDecoration(labelText: "Gênero"),
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
                  decoration: const InputDecoration(labelText: "Duração (minutos)"),
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: [
                    const Text("Nota:   "),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 30,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
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
                  decoration: const InputDecoration(labelText: "Ano"),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: edtDescricao,
                  decoration: const InputDecoration(labelText: "Descrição"),
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _salvarCadastro,
        child: const Icon(Icons.save),
      ),
    );
  }
}
