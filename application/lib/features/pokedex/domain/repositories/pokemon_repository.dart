import 'package:beauty_pokedex/features/pokedex/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getAll(int index);
}
