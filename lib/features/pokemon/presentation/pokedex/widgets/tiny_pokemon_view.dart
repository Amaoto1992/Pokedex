import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/widgets/poke_button.dart';

class TinyPokemonView extends StatelessWidget {
  const TinyPokemonView({
    Key? key,
    required this.selectedImageUrl,
    required this.itemCount,
    required this.pokemonEntity,
  }) : super(key: key);

  final List<String> selectedImageUrl;
  final int itemCount;
  final List<PokemonEntity> pokemonEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Text(
              'OTHERS',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 10),
              child: GridView.builder(
                itemCount: itemCount,
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                  crossAxisCount: 2,
                ),
                itemBuilder: (_, index) => Column(
                  children: [
                    PokeButton(
                      pokemonEntity: pokemonEntity[index],
                      selectedImageUrl: selectedImageUrl[index],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
