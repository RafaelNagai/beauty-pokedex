import 'package:beauty_pokedex/features/pokedex/domain/entities/type_entity.dart';

class Pokemon {
  const Pokemon({
    required this.name,
    required this.image,
    required this.types,
  });

  final String name;
  final String image;
  final List<Type> types;
}
