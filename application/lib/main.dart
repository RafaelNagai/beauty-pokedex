import 'package:beauty_pokedex/core/environment/production_environment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/dependency_injection.dart/registered_injection.dart';
import 'features/pokedex/presentation/pokemon_list_page.dart';

void main() {
  registerInjections(ProductionEnvironment());
  runApp(const GetMaterialApp(
    home: PokemonListPage(),
  ));
}
