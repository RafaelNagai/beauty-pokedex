import 'package:beauty_pokedex/features/pokedex/domain/datasources/pokemon_remote_datasource.dart';
import 'package:beauty_pokedex/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:beauty_pokedex/features/pokedex/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({
    required this.pokemonDatasource,
  });

  final PokemonDatasource pokemonDatasource;

  @override
  Future<List<Pokemon>> getAll(int index) async {
    return await pokemonDatasource.all(index);
  }
}
