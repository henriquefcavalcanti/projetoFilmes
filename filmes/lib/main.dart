import 'package:filmes/screens/cadastrar_filme.dart';
import 'package:filmes/screens/detalhes_filme.dart';
import 'package:filmes/screens/lista_filmes.dart';
import 'package:filmes/utils/app_rotas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const ListaFilmes(),
        AppRoutes.CADASTRAR_FILME: (ctx) => const CadastrarFilme(),
        AppRoutes.DETALHES_FILME: (ctx) => const DetalhesFilme(),
      },
    );
  }
}
