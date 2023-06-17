import 'dart:convert';

class PokemonEntity {
  final int? id;
  final String? name;
  final int? weight;
  final int? height;
  final List<Abilities>? abilities;
  final List<Types>? types;
  final Sprites? sprites;
  final int? baseExperience;

  PokemonEntity({
    this.id,
    this.name,
    this.weight,
    this.height,
    this.abilities,
    this.types,
    this.sprites,
    this.baseExperience,
  });

  PokemonEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        weight = json['weight'],
        height = json['height'],
        abilities = (json['abilities'] as List<dynamic>)
            .map((e) => Abilities.fromJson(e))
            .toList(),
        types = (json['types'] as List<dynamic>)
            .map((e) => Types.fromJson(e))
            .toList(),
        sprites = Sprites.fromJson(json['sprites']),
        baseExperience = json['baseExperience'];
}

class Abilities {
  Abilities({this.ability, this.slot});

  final Ability? ability;
  final int? slot;

  Abilities.fromJson(Map<String, dynamic> json)
      : ability = Ability.fromJson(json['ability']),
        slot = json['slot'];
}

class Ability {
  Ability({this.name});

  final String? name;

  Ability.fromJson(Map<String, dynamic> json) : name = json['name'];
}

class Types {
  Types({this.slot, this.type});

  final int? slot;
  final Ability? type;

  Types.fromJson(Map<String, dynamic> json)
      : slot = json['slot'],
        type = Ability.fromJson(json['type']);
}

class Sprites {
  Sprites({this.other});

  final OtherSprite? other;

  Sprites.fromJson(Map<String, dynamic> json) :
        other = OtherSprite.fromJson(json['other']);
}

class OtherSprite {
  OtherSprite({this.officialArtwork});

  final OfficialArtwork? officialArtwork;

  OtherSprite.fromJson(Map<String, dynamic> json)
      : officialArtwork = OfficialArtwork.fromJson(json['official-artwork']);
}

class OfficialArtwork {
  OfficialArtwork({this.frontDefault});

  final String? frontDefault;

  OfficialArtwork.fromJson(Map<String, dynamic> json)
      : frontDefault = json['front_default'];
}
