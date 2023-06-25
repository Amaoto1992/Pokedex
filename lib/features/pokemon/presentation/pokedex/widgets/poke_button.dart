import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/cubit/pokemon_cubit.dart';
import 'package:pokedex/injection_container.dart';

class PokeButton extends StatelessWidget {
  const PokeButton({
    Key? key,
    required this.imageNetwork,
  }) : super(key: key);

  final String imageNetwork;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        serviceLocator<PokemonCubit>().selectedPokemon();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade500,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: SizedBox(
        height: 80,
        width: 60,
        child: Image.network(imageNetwork),
      ),
    );
  }
}
