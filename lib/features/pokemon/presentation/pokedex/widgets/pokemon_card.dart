import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/widgets/pokemon_stat.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.imageNetwork,
    required this.pokemonId,
    required this.pokemonLevel,
    required this.pokemonType,
    required this.pokemonHability,
    required this.pokemonHeight,
    required this.pokemonWeight,
  }) : super(key: key);

  final String imageNetwork;
  final String pokemonId;
  final String pokemonLevel;
  final String pokemonType;
  final String pokemonHability;
  final String pokemonHeight;
  final String pokemonWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              height: 255,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 54.0),
                    child: Column(
                      children: [
                        PokemonStat(
                          statName: 'NO',
                          value: pokemonId,
                        ),
                        const SizedBox(height: 10),
                        PokemonStat(
                          statName: 'LEVEL',
                          value: pokemonLevel,
                        ),
                        const SizedBox(height: 10),
                        PokemonStat(
                          statName: 'TYPE',
                          value: pokemonType,
                        ),
                        const SizedBox(height: 10),
                        PokemonStat(
                          statName: 'HABILITY',
                          value: pokemonHability.toString().toUpperCase(),
                        ),
                        const SizedBox(height: 10),
                        PokemonStat(
                          statName: 'HEIGHT',
                          value: '$pokemonHeight cms',
                        ),
                        const SizedBox(height: 10),
                        PokemonStat(
                          statName: 'WEIGHT',
                          value: '$pokemonWeight Kg',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Image.network(
              imageNetwork,
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}
