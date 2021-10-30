import 'package:beauty_pokedex/core/usecase/usecase.dart';
import 'package:beauty_pokedex/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:get/get.dart';

class PokemonListController extends GetxController {
  PokemonListController({
    required this.getAllPokemonsUseCase,
  });

  final UseCase<List<Pokemon>, int> getAllPokemonsUseCase;

  final List<Pokemon> pokemons = <Pokemon>[].obs;

  init() async {
    getAllPokemonsUseCase(0).then((value) {
      pokemons.addAll(value);
    });
  }
}
