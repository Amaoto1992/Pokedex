import 'package:pokedex/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  PokemonRepositoryImpl({required this.baseUrl});

  final String baseUrl;

  @override
  Future<List<PokemonEntity>> getPokemonList() {
    late List<PokemonEntity> pokemonList;
    var url = Uri.https('https://pokeapi.co', '');
    throw UnimplementedError();
  }
}
