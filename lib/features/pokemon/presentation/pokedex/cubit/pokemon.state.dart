import 'package:pokedex/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/cubit/pokemon_status.dart';

class PokemonState {
  const PokemonState({
    required this.error,
    required this.status,
    required this.pokemonList,
    required this.pokemonEntity,
    required this.selectedImageUrl,
  });

  factory PokemonState.initialState({
    required String selectedImageUrl,
    required PokemonEntity pokemonEntity,
  }) =>
      PokemonState(
        error: '',
        status: PokemonStatus.initial,
        pokemonList: [],
        selectedImageUrl: selectedImageUrl,
        pokemonEntity: pokemonEntity,
      );

  final String error;
  final PokemonStatus status;
  final String selectedImageUrl;
  final PokemonEntity pokemonEntity;
  final List<PokemonEntity> pokemonList;

  PokemonState copyWith({
    PokemonStatus? status,
    List<PokemonEntity>? pokemonList,
    PokemonEntity? pokemonEntity,
    String? selectedImageUrl,
    String? error,
  }) =>
      PokemonState(
        status: status ?? this.status,
        pokemonList: pokemonList ?? this.pokemonList,
        pokemonEntity: pokemonEntity ?? this.pokemonEntity,
        selectedImageUrl: selectedImageUrl ?? this.selectedImageUrl,
        error: error ?? this.error,
      );
}
