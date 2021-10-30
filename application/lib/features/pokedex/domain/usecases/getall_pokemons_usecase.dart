import 'package:beauty_pokedex/core/usecase/usecase.dart';
import 'package:beauty_pokedex/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:beauty_pokedex/features/pokedex/domain/repositories/pokemon_repository.dart';

class GetAllPokemonsUseCase implements UseCase<List<Pokemon>, int> {
  GetAllPokemonsUseCase({
    required this.pokemonRepository,
  });

  final PokemonRepository pokemonRepository;

  @override
  Future<List<Pokemon>> call(index) async {
    return await pokemonRepository.getAll(index);
  }
}
