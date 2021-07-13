import 'package:pokeapi/model/utils/common.dart';

class Item {
  int? id;
  String? name;
  int? cost;
  int? flingPower;
  NamedAPIResource? flingEffect;
  List<NamedAPIResource>? attributes;
  NamedAPIResource? category;
  List<EffectEntries>? effectEntries;
  List<FlavorTextEntries>? flavorTextEntries;
  List<GameIndices>? gameIndices;
  List<Names>? names;
  Sprites? sprites;
  List<HeldByPokemon>? heldByPokemon;
  BabyTriggerFor? babyTriggerFor;

  Item(
      {this.id,
      this.name,
      this.cost,
      this.flingPower,
      this.flingEffect,
      this.attributes,
      this.category,
      this.effectEntries,
      this.flavorTextEntries,
      this.gameIndices,
      this.names,
      this.sprites,
      this.heldByPokemon,
      this.babyTriggerFor});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cost = json['cost'];
    flingPower = json['fling_power'];
    flingEffect = json['fling_effect'] != null
        ?  NamedAPIResource.fromJson(json['fling_effect'])
        : null;
    if (json['attributes'] != null) {
      attributes =  <NamedAPIResource>[];
      json['attributes'].forEach((v) {
        attributes!.add( NamedAPIResource.fromJson(v));
      });
    }
    category = json['category'] != null
        ?  NamedAPIResource.fromJson(json['category'])
        : null;
    if (json['effect_entries'] != null) {
      effectEntries =  <EffectEntries>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add( EffectEntries.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries =  <FlavorTextEntries>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add( FlavorTextEntries.fromJson(v));
      });
    }
    if (json['game_indices'] != null) {
      gameIndices =  <GameIndices>[];
      json['game_indices'].forEach((v) {
        gameIndices!.add( GameIndices.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names =  <Names>[];
      json['names'].forEach((v) {
        names!.add( Names.fromJson(v));
      });
    }
    sprites =
        json['sprites'] != null ?  Sprites.fromJson(json['sprites']) : null;
    if (json['held_by_pokemon'] != null) {
      heldByPokemon =  <HeldByPokemon>[];
      json['held_by_pokemon'].forEach((v) {
        heldByPokemon!.add( HeldByPokemon.fromJson(v));
      });
    }
    babyTriggerFor = json['baby_trigger_for'] != null
        ?  BabyTriggerFor.fromJson(json['baby_trigger_for'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cost'] = this.cost;
    data['fling_power'] = this.flingPower;
    if (this.flingEffect != null) {
      data['fling_effect'] = this.flingEffect!.toJson();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries!.map((v) => v.toJson()).toList();
    }
    if (this.flavorTextEntries != null) {
      data['flavor_text_entries'] =
          this.flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    if (this.gameIndices != null) {
      data['game_indices'] = this.gameIndices!.map((v) => v.toJson()).toList();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    if (this.sprites != null) {
      data['sprites'] = this.sprites!.toJson();
    }
    if (this.heldByPokemon != null) {
      data['held_by_pokemon'] =
          this.heldByPokemon!.map((v) => v.toJson()).toList();
    }
    if (this.babyTriggerFor != null) {
      data['baby_trigger_for'] = this.babyTriggerFor!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Item{id: $id, name: $name, cost: $cost, flingPower: $flingPower, flingEffect: $flingEffect, attributes: $attributes, category: $category, effectEntries: $effectEntries, flavorTextEntries: $flavorTextEntries, gameIndices: $gameIndices, names: $names, sprites: $sprites, heldByPokemon: $heldByPokemon, babyTriggerFor: $babyTriggerFor}';
  }
}

class EffectEntries {
  String? effect;
  String? shortEffect;
  NamedAPIResource? language;

  EffectEntries({this.effect, this.shortEffect, this.language});

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    shortEffect = json['short_effect'];
    language = json['language'] != null
        ?  NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['effect'] = this.effect;
    data['short_effect'] = this.shortEffect;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'EffectEntries{effect: $effect, shortEffect: $shortEffect, language: $language}';
  }
}

class FlavorTextEntries {
  String? text;
  NamedAPIResource? versionGroup;
  NamedAPIResource? language;

  FlavorTextEntries({this.text, this.versionGroup, this.language});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    versionGroup = json['version_group'] != null
        ?  NamedAPIResource.fromJson(json['version_group'])
        : null;
    language = json['language'] != null
        ?  NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['text'] = this.text;
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup!.toJson();
    }
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'FlavorTextEntries{text: $text, versionGroup: $versionGroup, language: $language}';
  }
}

class GameIndices {
  int? gameIndex;
  NamedAPIResource? generation;

  GameIndices({this.gameIndex, this.generation});

  GameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    generation = json['generation'] != null
        ?  NamedAPIResource.fromJson(json['generation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['game_index'] = this.gameIndex;
    if (this.generation != null) {
      data['generation'] = this.generation!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'GameIndices{gameIndex: $gameIndex, generation: $generation}';
  }
}

class Names {
  String? name;
  NamedAPIResource? language;

  Names({this.name, this.language});

  Names.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'] != null
        ?  NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = this.name;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Names{name: $name, language: $language}';
  }
}

class Sprites {
  String? sprite;

  Sprites({this.sprite});

  Sprites.fromJson(Map<String, dynamic> json) {
    sprite = json['default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['default'] = this.sprite;
    return data;
  }

  @override
  String toString() {
    return 'Sprites{sprite: $sprite}';
  }
}

class HeldByPokemon {
  NamedAPIResource? pokemon;
  List<VersionDetails>? versionDetails;

  HeldByPokemon({this.pokemon, this.versionDetails});

  HeldByPokemon.fromJson(Map<String, dynamic> json) {
    pokemon = json['pokemon'] != null
        ?  NamedAPIResource.fromJson(json['pokemon'])
        : null;
    if (json['version_details'] != null) {
      versionDetails =  <VersionDetails>[];
      json['version_details'].forEach((v) {
        versionDetails!.add( VersionDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon!.toJson();
    }
    if (this.versionDetails != null) {
      data['version_details'] =
          this.versionDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'HeldByPokemon{pokemon: $pokemon, versionDetails: $versionDetails}';
  }
}

class VersionDetails {
  int? rarity;
  NamedAPIResource? version;

  VersionDetails({this.rarity, this.version});

  VersionDetails.fromJson(Map<String, dynamic> json) {
    rarity = json['rarity'];
    version = json['version'] != null
        ?  NamedAPIResource.fromJson(json['version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['rarity'] = this.rarity;
    if (this.version != null) {
      data['version'] = this.version!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'VersionDetails{rarity: $rarity, version: $version}';
  }
}

class BabyTriggerFor {
  String? url;

  BabyTriggerFor({this.url});

  BabyTriggerFor.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }

  @override
  String toString() {
    return 'BabyTriggerFor{url: $url}';
  }
}
