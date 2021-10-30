import 'package:beauty_pokedex/core/dependency_injection.dart/dependency_injection.dart';
import 'package:beauty_pokedex/core/environment/environment.dart';
import 'package:beauty_pokedex/core/http/get_http.dart';
import 'package:beauty_pokedex/core/http/http.dart';
import 'package:beauty_pokedex/core/task_manager/task_manager.dart';
import 'package:beauty_pokedex/core/usecase/usecase.dart';
import 'package:beauty_pokedex/features/pokedex/data/datasources/pokemon_remote_datasource.dart';
import 'package:beauty_pokedex/features/pokedex/data/repositories/pokemon_repository.dart';
import 'package:beauty_pokedex/features/pokedex/domain/datasources/pokemon_remote_datasource.dart';
import 'package:beauty_pokedex/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:beauty_pokedex/features/pokedex/domain/repositories/pokemon_repository.dart';
import 'package:beauty_pokedex/features/pokedex/domain/usecases/getall_pokemons_usecase.dart';
import 'package:beauty_pokedex/features/pokedex/presentation/controllers/pokemon_list_controller.dart';

void registerInjections(Environment environment) {
  DI.register<Environment>(environment);
  DI.register<Http>(GetHttp(environment: DI.get()));
  DI.register<PokemonDatasource>(PokemonRemoteDatasourceImpl(http: DI.get()));
  DI.register<PokemonRepository>(
      PokemonRepositoryImpl(pokemonDatasource: DI.get()));
  DI.register<UseCase<List<Pokemon>, int>>(
      GetAllPokemonsUseCase(pokemonRepository: DI.get()));
  DI.register<PokemonListController>(
      PokemonListController(getAllPokemonsUseCase: DI.get()));
  DI.register<TaskManager>(TaskManager());
}
