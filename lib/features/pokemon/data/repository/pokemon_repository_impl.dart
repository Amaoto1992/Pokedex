import 'package:pokedex/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/injection_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PokemonRepositoryImpl extends PokemonRepository {
  PokemonRepositoryImpl({required this.baseUrl});

  final String baseUrl;

  @override
  Future<List<PokemonEntity>> getPokemonList() async {
    final String url = '$baseUrl${unencodedPath}pokemon/?limit=40';
    List<PokemonEntity> pokemonList = [];
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(url));
      print("First response: $response");
      if (response.statusCode == 200) {
        print(response.statusCode);
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        for (Map<String, dynamic> item in jsonResponse['results']) {
          var pokemonResponse = await client.get(Uri.parse(item['url']));
          if (pokemonResponse.statusCode == 200) {
            var pokemonJsonResponse = convert.jsonDecode(pokemonResponse.body)
                as Map<String, dynamic>;

            final PokemonEntity pokemon =
                PokemonEntity.fromJson(pokemonJsonResponse);

            pokemonList.add(pokemon);
          }
        }
      }
    } finally {
      client.close();
    }

    return pokemonList;
  }
}
