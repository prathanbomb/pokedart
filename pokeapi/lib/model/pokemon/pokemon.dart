import 'package:pokeapi/model/utils/common.dart';

class Pokemon {
  int id;
  String name;
  int baseExperience;
  int height;
  bool isDefault;
  int order;
  int weight;
  List<Abilities> abilities;
  List<NamedAPIResource> forms;
  List<GameIndices> gameIndices;
  List<HeldItems> heldItems;
  List<LocationAreaEncounters> locationAreaEncounters;
  List<Moves> moves;
  NamedAPIResource species;
  Sprites sprites;
  List<Stats> stats;
  List<Types> types;

  Pokemon({this.id,
    this.name,
      this.baseExperience,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    this.abilities,
      this.forms,
      this.gameIndices,
      this.heldItems,
      this.locationAreaEncounters,
      this.moves,
      this.species,
      this.sprites,
      this.stats,
    this.types});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    baseExperience = json['base_experience'];
    height = json['height'];
    isDefault = json['is_default'];
    order = json['order'];
    weight = json['weight'];
    if (json['abilities'] != null) {
      abilities = new List<Abilities>();
      json['abilities'].forEach((v) {
        abilities.add(new Abilities.fromJson(v));
      });
    }
    if (json['forms'] != null) {
      forms = new List<NamedAPIResource>();
      json['forms'].forEach((v) {
        forms.add(new NamedAPIResource.fromJson(v));
      });
    }
    if (json['game_indices'] != null) {
      gameIndices = new List<GameIndices>();
      json['game_indices'].forEach((v) {
        gameIndices.add(new GameIndices.fromJson(v));
      });
    }
    if (json['held_items'] != null) {
      heldItems = new List<HeldItems>();
      json['held_items'].forEach((v) {
        heldItems.add(new HeldItems.fromJson(v));
      });
    }
    if (json['location_area_encounters'] != null) {
      locationAreaEncounters = new List<LocationAreaEncounters>();
      json['location_area_encounters'].forEach((v) {
        locationAreaEncounters.add(new LocationAreaEncounters.fromJson(v));
      });
    }
    if (json['moves'] != null) {
      moves = new List<Moves>();
      json['moves'].forEach((v) {
        moves.add(new Moves.fromJson(v));
      });
    }
    species = json['species'] != null
        ? new NamedAPIResource.fromJson(json['species'])
        : null;
    sprites =
    json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
    if (json['stats'] != null) {
      stats = new List<Stats>();
      json['stats'].forEach((v) {
        stats.add(new Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = new List<Types>();
      json['types'].forEach((v) {
        types.add(new Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['base_experience'] = this.baseExperience;
    data['height'] = this.height;
    data['is_default'] = this.isDefault;
    data['order'] = this.order;
    data['weight'] = this.weight;
    if (this.abilities != null) {
      data['abilities'] = this.abilities.map((v) => v.toJson()).toList();
    }
    if (this.forms != null) {
      data['forms'] = this.forms.map((v) => v.toJson()).toList();
    }
    if (this.gameIndices != null) {
      data['game_indices'] = this.gameIndices.map((v) => v.toJson()).toList();
    }
    if (this.heldItems != null) {
      data['held_items'] = this.heldItems.map((v) => v.toJson()).toList();
    }
    if (this.locationAreaEncounters != null) {
      data['location_area_encounters'] =
          this.locationAreaEncounters.map((v) => v.toJson()).toList();
    }
    if (this.moves != null) {
      data['moves'] = this.moves.map((v) => v.toJson()).toList();
    }
    if (this.species != null) {
      data['species'] = this.species.toJson();
    }
    if (this.sprites != null) {
      data['sprites'] = this.sprites.toJson();
    }
    if (this.stats != null) {
      data['stats'] = this.stats.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Abilities {
  bool isHidden;
  int slot;
  NamedAPIResource ability;

  Abilities({this.isHidden, this.slot, this.ability});

  Abilities.fromJson(Map<String, dynamic> json) {
    isHidden = json['is_hidden'];
    slot = json['slot'];
    ability = json['ability'] != null
        ? new NamedAPIResource.fromJson(json['ability'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_hidden'] = this.isHidden;
    data['slot'] = this.slot;
    if (this.ability != null) {
      data['ability'] = this.ability.toJson();
    }
    return data;
  }
}

class GameIndices {
  int gameIndex;
  NamedAPIResource version;

  GameIndices({this.gameIndex, this.version});

  GameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version = json['version'] != null
        ? new NamedAPIResource.fromJson(json['version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_index'] = this.gameIndex;
    if (this.version != null) {
      data['version'] = this.version.toJson();
    }
    return data;
  }
}

class HeldItems {
  NamedAPIResource item;
  List<VersionDetails> versionDetails;

  HeldItems({this.item, this.versionDetails});

  HeldItems.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null
        ? new NamedAPIResource.fromJson(json['item'])
        : null;
    if (json['version_details'] != null) {
      versionDetails = new List<VersionDetails>();
      json['version_details'].forEach((v) {
        versionDetails.add(new VersionDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item.toJson();
    }
    if (this.versionDetails != null) {
      data['version_details'] =
          this.versionDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VersionDetails {
  int rarity;
  NamedAPIResource version;

  VersionDetails({this.rarity, this.version});

  VersionDetails.fromJson(Map<String, dynamic> json) {
    rarity = json['rarity'];
    version = json['version'] != null
        ? new NamedAPIResource.fromJson(json['version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rarity'] = this.rarity;
    if (this.version != null) {
      data['version'] = this.version.toJson();
    }
    return data;
  }
}

class LocationAreaEncounters {
  NamedAPIResource locationArea;
  List<VersionDetails> versionDetails;

  LocationAreaEncounters({this.locationArea, this.versionDetails});

  LocationAreaEncounters.fromJson(Map<String, dynamic> json) {
    locationArea = json['location_area'] != null
        ? new NamedAPIResource.fromJson(json['location_area'])
        : null;
    if (json['version_details'] != null) {
      versionDetails = new List<VersionDetails>();
      json['version_details'].forEach((v) {
        versionDetails.add(new VersionDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.locationArea != null) {
      data['location_area'] = this.locationArea.toJson();
    }
    if (this.versionDetails != null) {
      data['version_details'] =
          this.versionDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EncounterDetails {
  int minLevel;
  int maxLevel;
  List<ConditionValues> conditionValues;
  int chance;
  Method method;

  EncounterDetails({this.minLevel,
    this.maxLevel,
    this.conditionValues,
    this.chance,
    this.method});

  EncounterDetails.fromJson(Map<String, dynamic> json) {
    minLevel = json['min_level'];
    maxLevel = json['max_level'];
    if (json['condition_values'] != null) {
      conditionValues = new List<ConditionValues>();
      json['condition_values'].forEach((v) {
        conditionValues.add(new ConditionValues.fromJson(v));
      });
    }
    chance = json['chance'];
    method =
    json['method'] != null ? new Method.fromJson(json['method']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min_level'] = this.minLevel;
    data['max_level'] = this.maxLevel;
    if (this.conditionValues != null) {
      data['condition_values'] =
          this.conditionValues.map((v) => v.toJson()).toList();
    }
    data['chance'] = this.chance;
    if (this.method != null) {
      data['method'] = this.method.toJson();
    }
    return data;
  }
}

class ConditionValues {
  String name;
  String url;

  ConditionValues({this.name, this.url});

  ConditionValues.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Method {
  String name;
  String url;

  Method({this.name, this.url});

  Method.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Moves {
  NamedAPIResource move;
  List<VersionGroupDetails> versionGroupDetails;

  Moves({this.move, this.versionGroupDetails});

  Moves.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null
        ? new NamedAPIResource.fromJson(json['move'])
        : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = new List<VersionGroupDetails>();
      json['version_group_details'].forEach((v) {
        versionGroupDetails.add(new VersionGroupDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.move != null) {
      data['move'] = this.move.toJson();
    }
    if (this.versionGroupDetails != null) {
      data['version_group_details'] =
          this.versionGroupDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VersionGroupDetails {
  int levelLearnedAt;
  VersionGroup versionGroup;
  NamedAPIResource moveLearnMethod;

  VersionGroupDetails(
      {this.levelLearnedAt, this.versionGroup, this.moveLearnMethod});

  VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    versionGroup = json['version_group'] != null
        ? new VersionGroup.fromJson(json['version_group'])
        : null;
    moveLearnMethod = json['move_learn_method'] != null
        ? new NamedAPIResource.fromJson(json['move_learn_method'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level_learned_at'] = this.levelLearnedAt;
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup.toJson();
    }
    if (this.moveLearnMethod != null) {
      data['move_learn_method'] = this.moveLearnMethod.toJson();
    }
    return data;
  }
}

class VersionGroup {
  String name;
  String url;

  VersionGroup({this.name, this.url});

  VersionGroup.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Sprites {
  String backFemale;
  String backShinyFemale;
  String backDefault;
  String frontFemale;
  String frontShinyFemale;
  String backShiny;
  String frontDefault;
  String frontShiny;

  Sprites({this.backFemale,
    this.backShinyFemale,
    this.backDefault,
    this.frontFemale,
    this.frontShinyFemale,
    this.backShiny,
    this.frontDefault,
    this.frontShiny});

  Sprites.fromJson(Map<String, dynamic> json) {
    backFemale = json['back_female'];
    backShinyFemale = json['back_shiny_female'];
    backDefault = json['back_default'];
    frontFemale = json['front_female'];
    frontShinyFemale = json['front_shiny_female'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['back_female'] = this.backFemale;
    data['back_shiny_female'] = this.backShinyFemale;
    data['back_default'] = this.backDefault;
    data['front_female'] = this.frontFemale;
    data['front_shiny_female'] = this.frontShinyFemale;
    data['back_shiny'] = this.backShiny;
    data['front_default'] = this.frontDefault;
    data['front_shiny'] = this.frontShiny;
    return data;
  }
}

class Stats {
  int baseStat;
  int effort;
  NamedAPIResource stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null
        ? new NamedAPIResource.fromJson(json['stat'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_stat'] = this.baseStat;
    data['effort'] = this.effort;
    if (this.stat != null) {
      data['stat'] = this.stat.toJson();
    }
    return data;
  }
}

class Types {
  int slot;
  NamedAPIResource type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null
        ? new NamedAPIResource.fromJson(json['type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    return data;
  }
}
