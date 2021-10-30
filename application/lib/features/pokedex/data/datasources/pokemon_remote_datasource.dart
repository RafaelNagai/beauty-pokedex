import 'package:beauty_pokedex/core/http/http.dart';
import 'package:beauty_pokedex/features/pokedex/domain/datasources/pokemon_remote_datasource.dart';
import 'package:beauty_pokedex/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:beauty_pokedex/features/pokedex/domain/entities/type_entity.dart';

class PokemonRemoteDatasourceImpl implements PokemonDatasource {
  PokemonRemoteDatasourceImpl({
    required this.http,
  });

  final Http http;
  final int limit = 15;

  @override
  Future<List<Pokemon>> all(int index) async {
    final response =
        await http.getResponse('pokemon?offset=$index&limit=$limit');
    final results = response.body['results'] as List<dynamic>;

    final List<Pokemon> pokemons = [];
    for (var element in results) {
      final pokemon = await get(element['name']);
      pokemons.add(pokemon);
    }
    return pokemons;
  }

  @override
  Future<Pokemon> get(String name) async {
    final response = await http.getResponse('/pokemon/$name');
    return (response.body as Map).toPokemon(name);
  }
}

extension _ConverterMapToPokemon on Map {
  Pokemon toPokemon(String name) {
    return Pokemon(
      name: name,
      image: this['sprites']['other']['official-artwork']['front_default'],
      types: (this['types'] as List).toTypes(),
    );
  }
}

extension _ConverterMapToType on Map {
  Type toType() {
    return Type(name: this['type']['name']);
  }
}

extension _ConverterListToType on List {
  List<Type> toTypes() {
    return List<Type>.generate(
        length, (index) => (this[index] as Map).toType());
  }
}
