import 'package:beauty_pokedex/core/environment/environment.dart';

class ProductionEnvironment implements Environment {
  @override
  String url = "https://pokeapi.co/api/v2/";
}
