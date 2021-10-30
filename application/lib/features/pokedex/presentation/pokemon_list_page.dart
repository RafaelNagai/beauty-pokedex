import 'package:beauty_pokedex/core/dependency_injection.dart/dependency_injection.dart';
import 'package:beauty_pokedex/features/pokedex/presentation/controllers/pokemon_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final PokemonListController controller = DI.get<PokemonListController>();

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.pokemons.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(controller.pokemons[index].name),
            );
          },
        );
      }),
    );
  }
}
