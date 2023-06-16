import 'package:get_it/get_it.dart';
import 'package:pokedex/features/pokemon/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex/features/pokemon/domain/repositories/pokemon_repository.dart';

//Api client
const String baseUrl = "https://pokeapi.co/api/v2/";

final serviceLocator = GetIt.instance;

void setUp(){
  //Repositories
  serviceLocator.registerFactory<PokemonRepository>(() => PokemonRepositoryImpl(baseUrl: baseUrl));
}