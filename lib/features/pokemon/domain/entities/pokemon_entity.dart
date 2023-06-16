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
  final Ability? ability;
  final int? slot;

  Abilities({this.ability, this.slot});
}

class Ability {
  final String? name;

  Ability({this.name});
}

class Types {
  final int? slot;
  final Ability? type;

  Types({this.slot, this.type});
}

class Sprites {
  final OtherSprite? other;

  Sprites({this.other});
}

class OtherSprite {
  final OfficialArtwork? officialArtwork;

  OtherSprite({this.officialArtwork});
}

class OfficialArtwork {
  final String? frontDefault;

  OfficialArtwork({this.frontDefault});
}