import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/cubit/pokemon.state.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/cubit/pokemon_cubit.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/cubit/pokemon_status.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/widgets/pokemon_card.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/widgets/tiny_pokemon_view.dart';
import 'package:pokedex/injection_container.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/pokeball.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 5),
            const Text('Pokedex'),
          ],
        ),
        backgroundColor: Colors.red.shade500,
        centerTitle: true,
      ),
      body: BlocProvider<PokemonCubit>(
        create: (context) => serviceLocator<PokemonCubit>()..getPokemonList(),
        child: BlocBuilder<PokemonCubit, PokemonState>(
          builder: (context, state) {
            if (state.status == PokemonStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == PokemonStatus.loaded) {
              final List<PokemonEntity> pokemonList = state.pokemonList;
              return Center(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, i) {
                    final pokemon = state.pokemonList[i];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        nameContainer(pokemon),
                        const SizedBox(height: 20),
                        PokemonCard(
                          imageNetwork: state.selectedImageUrl.isEmpty
                              ? pokemon.sprites!.other!.officialArtwork!
                                  .frontDefault!
                              : state.selectedImageUrl,
                          pokemonId: pokemon.height.toString(),
                          pokemonLevel: pokemon.baseExperience.toString(),
                          pokemonType: pokemon.types![0].type!.name!
                              .toString()
                              .toUpperCase(),
                          pokemonHability: pokemon.abilities![0].ability!.name!,
                          pokemonHeight:
                              pokemon.height.toString().toUpperCase(),
                          pokemonWeight:
                              pokemon.weight.toString().toUpperCase(),
                        ),
                        const SizedBox(height: 20),
                        TinyPokemonView(
                          itemCount: pokemonList.length,
                          imageUrls: pokemonList
                              .map((pokemon) => pokemon.sprites!.other!
                                  .officialArtwork!.frontDefault!)
                              .toList(),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: Text(state.error),
              );
            }
          },
        ),
      ),
    );
  }

  Container nameContainer(PokemonEntity pokemon) {
    return Container(
      height: 50,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pokemon.name.toString().toUpperCase(),
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
