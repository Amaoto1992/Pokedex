import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/cubit/pokemon_cubit.dart';

class PokeButton extends StatelessWidget {
  const PokeButton({
    Key? key,
    required this.selectedImageUrl,
    required this.pokemonEntity,
  }) : super(key: key);

  final String selectedImageUrl;
  final PokemonEntity pokemonEntity;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<PokemonCubit>().selectedPokemon(selectedImageUrl);
        context.read<PokemonCubit>().selectedPokemonEntity(pokemonEntity);
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
        child: Image.network(selectedImageUrl),
      ),
    );
  }
}
