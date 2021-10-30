import 'package:beauty_pokedex/features/pokedex/domain/entities/pokemon_entity.dart';

abstract class PokemonDatasource {
  Future<List<Pokemon>> all(int index);
  Future<Pokemon> get(String name);
}
