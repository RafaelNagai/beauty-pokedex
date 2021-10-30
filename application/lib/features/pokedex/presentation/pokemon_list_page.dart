import 'package:beauty_pokedex/core/dependency_injection.dart/dependency_injection.dart';
import 'package:beauty_pokedex/core/task_manager/task_manager.dart';
import 'package:beauty_pokedex/features/pokedex/presentation/controllers/pokemon_list_controller.dart';
import 'package:beauty_pokedex/features/pokedex/presentation/widgets/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final PokemonListController controller = DI.get<PokemonListController>();
  final TaskManager taskManager = DI.get<TaskManager>();

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: controller.pokemons.length,
            itemBuilder: (_, index) {
              return PokemonCard(
                name: controller.pokemons[index].name,
                imageUrl: controller.pokemons[index].image,
                onTap: () {
                  taskManager.add(() async {
                    for (var i = 0; i < 5; i++) {
                      await Future.delayed(const Duration(seconds: 1));
                      debugPrint('count: $i');
                    }
                    debugPrint('Passed');
                  });
                },
              );
            },
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          );
        },
      ),
    );
  }
}
