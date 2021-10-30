import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    required this.name,
    required this.imageUrl,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _randomColor(name),
      child: ClipRRect(
        child: Stack(
          alignment: Alignment.center,
          children: [
            backgroundPokeball,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: infoPokemon,
            ),
          ],
        ),
      ),
    );
  }

  Widget get backgroundPokeball => Transform.rotate(
        angle: 0.6,
        child: Transform.scale(
          scale: 1.3,
          child: SvgPicture.asset(
            'assets/pokeball.svg',
            color: Colors.amber.withAlpha(100),
          ),
        ),
      );

  Widget get infoPokemon => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(imageUrl),
          ),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const Text(
            'Tap to Download',
            style: TextStyle(fontSize: 10),
          ),
        ],
      );

  Color _randomColor(String name) {
    List<int> values = [0, 0, 0];
    for (var i = 0; i < 3; i++) {
      if (i >= name.length) {
        break;
      }
      values[i] = name.codeUnitAt(i) * 2;
    }
    return Color.fromRGBO(values[0], values[1], values[2], 1);
  }
}
