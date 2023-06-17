import 'package:flutter/material.dart';
import 'package:projeto_filme/utils/app_rotas.dart';
import 'package:projeto_filme/views/Editar_filme.dart';
import 'views/detalhes_filme.dart';
import 'package:projeto_filme/views/cadastrar_filme.dart';
import 'package:projeto_filme/views/listar_filmes.dart';

main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        AppRoutes.HOME: (ctx) => const ListarFilmes(),
        AppRoutes.CADASTRAR_FILME: (ctx) => const CadastrarFilme(),
        AppRoutes.DETALHES_FILME: (ctx) => const DetalhesFilme(),
        AppRoutes.EDITAR_FILME: (ctx) => EditarFilmeTela(),
      },
    );
  }
}
