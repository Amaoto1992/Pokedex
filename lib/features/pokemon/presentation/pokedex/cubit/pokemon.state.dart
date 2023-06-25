import 'package:pokedex/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/cubit/pokemon_status.dart';

class PokemonState {
  const PokemonState(
      {required this.error,
      required this.status,
      required this.pokemonList,
      required this.selectedImageUrl});

  factory PokemonState.initialState({
    required String selectedImageUrl,
  }) =>
      const PokemonState(
          error: '',
          status: PokemonStatus.initial,
          pokemonList: [],
          selectedImageUrl: '',
      );

  final String error;
  final PokemonStatus status;
  final String selectedImageUrl;
  final List<PokemonEntity> pokemonList;

  PokemonState copyWith(
          {PokemonStatus? status,
          List<PokemonEntity>? pokemonList,
          String? selectedImageUrl,
          String? error}) =>
      PokemonState(
        status: status ?? this.status,
        pokemonList: pokemonList ?? this.pokemonList,
        selectedImageUrl: selectedImageUrl ?? this.selectedImageUrl,
        error: error ?? this.error,
      );
}
