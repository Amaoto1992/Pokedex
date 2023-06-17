import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/cubit/pokemon.state.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/cubit/pokemon_cubit.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/cubit/pokemon_status.dart';
import 'package:pokedex/injection_container.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        centerTitle: true,
      ),
      body: BlocProvider<PokemonCubit>(
        create: (context) => serviceLocator<PokemonCubit>(),
        child: BlocConsumer<PokemonCubit, PokemonState>(
          listener: (context, state) {
            if (state.status == PokemonStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
            }else if(state.status == PokemonStatus.loaded){
              print('Resultado ${state.pokemonList}');
            }
          },
          builder: (context, state) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<PokemonCubit>().getPokemonList();
                },
                child: const Text('Pokemon List'),
              ),
            );
          },
        ),
      ),
    );
  }
}
