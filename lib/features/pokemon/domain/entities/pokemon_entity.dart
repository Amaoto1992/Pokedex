class PokemonEntity {
  final int? id;
  final String? name;
  final int? weight;
  final int? height;
  final List<Abilities>? abilities;
  final List<Types>? types;
  final Sprites? sprites;

  PokemonEntity({
    this.id,
    this.name,
    this.weight,
    this.height,
    this.abilities,
    this.types,
    this.sprites,
  });
}

class Abilities {
  Abilities({this.ability, this.slot});

  final Ability? ability;
  final int? slot;

  Abilities.fromJson(Map<String, dynamic> json)
      : ability = json['ability'],
        slot = json['slot'];
}

class Ability {
  Ability({this.name});

  final String? name;

  Ability.fromJson(Map<String, dynamic> json) :
        name = json['name'];
}

class Types {
  Types({this.slot, this.type});

  final int? slot;
  final Ability? type;

  Types.fromJson(Map<String, dynamic> json)
      : slot = json['slot'],
        type = json['type'];
}

class Sprites {
  Sprites({this.other});

  final OtherSprite? other;

  Sprites.fromJson(Map<String, dynamic> json) :
        other = json['other'];
}

class OtherSprite {
  OtherSprite({this.officialArtwork});

  final OfficialArtwork? officialArtwork;

  OtherSprite.fromJson(Map<String, dynamic> json)
      : officialArtwork = json['official-artwork'];
}

class OfficialArtwork {
  OfficialArtwork({this.frontDefault});

  final String? frontDefault;

  OfficialArtwork.fromJson(Map<String, dynamic> json)
      : frontDefault = json['front_default'];
}
