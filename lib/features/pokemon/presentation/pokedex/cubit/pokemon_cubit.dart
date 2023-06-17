import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/cubit/pokemon.state.dart';
import 'package:pokedex/features/pokemon/presentation/pokedex/cubit/pokemon_status.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit(this._pokemonRepository) : super(PokemonState.initialState());

  final PokemonRepository _pokemonRepository;

  void getPokemonList() async {
    emit(
      state.copyWith(status: PokemonStatus.loading),
    );
    try {
      final List<PokemonEntity> pokemonList =
          await _pokemonRepository.getPokemonList();
      emit(
        state.copyWith(
          status: PokemonStatus.loaded,
          pokemonList: pokemonList,
        ),
      );
    } catch (exception) {
      emit(
        state.copyWith(
          status: PokemonStatus.error,
          error: exception.toString(),
        ),
      );
    }
  }
}
