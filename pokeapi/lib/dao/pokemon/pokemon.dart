import 'package:pokeapi/dao/common.dart';

class Pokemon {
  List<Abilities> abilities;
  int baseExperience;
  List<CommonResult> forms;
  List<GameIndices> gameIndices;
  int height;
  List<HeldItems> heldItems;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  List<Moves> moves;
  String name;
  int order;
  CommonResult species;
  Sprites sprites;
  List<Stats> stats;
  List<Types> types;
  int weight;

  Pokemon(
      {this.abilities,
      this.baseExperience,
      this.forms,
      this.gameIndices,
      this.height,
      this.heldItems,
      this.id,
      this.isDefault,
      this.locationAreaEncounters,
      this.moves,
      this.name,
      this.order,
      this.species,
      this.sprites,
      this.stats,
      this.types,
      this.weight});

  Pokemon.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = new List<Abilities>();
      json['abilities'].forEach((v) {
        abilities.add(new Abilities.fromJson(v));
      });
    }
    baseExperience = json['base_experience'];
    if (json['forms'] != null) {
      forms = new List<CommonResult>();
      json['forms'].forEach((v) {
        forms.add(new CommonResult.fromJson(v));
      });
    }
    if (json['game_indices'] != null) {
      gameIndices = new List<GameIndices>();
      json['game_indices'].forEach((v) {
        gameIndices.add(new GameIndices.fromJson(v));
      });
    }
    height = json['height'];
    if (json['held_items'] != null) {
      heldItems = new List<HeldItems>();
      json['held_items'].forEach((v) {
        heldItems.add(new HeldItems.fromJson(v));
      });
    }
    id = json['id'];
    isDefault = json['is_default'];
    locationAreaEncounters = json['location_area_encounters'];
    if (json['moves'] != null) {
      moves = new List<Moves>();
      json['moves'].forEach((v) {
        moves.add(new Moves.fromJson(v));
      });
    }
    name = json['name'];
    order = json['order'];
    species = json['species'] != null
        ? new CommonResult.fromJson(json['species'])
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
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abilities != null) {
      data['abilities'] = this.abilities.map((v) => v.toJson()).toList();
    }
    data['base_experience'] = this.baseExperience;
    if (this.forms != null) {
      data['forms'] = this.forms.map((v) => v.toJson()).toList();
    }
    if (this.gameIndices != null) {
      data['game_indices'] = this.gameIndices.map((v) => v.toJson()).toList();
    }
    data['height'] = this.height;
    if (this.heldItems != null) {
      data['held_items'] = this.heldItems.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['is_default'] = this.isDefault;
    data['location_area_encounters'] = this.locationAreaEncounters;
    if (this.moves != null) {
      data['moves'] = this.moves.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['order'] = this.order;
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
    data['weight'] = this.weight;
    return data;
  }
}

class Abilities {
  CommonResult ability;
  bool isHidden;
  int slot;

  Abilities({this.ability, this.isHidden, this.slot});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability = json['ability'] != null
        ? new CommonResult.fromJson(json['ability'])
        : null;
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ability != null) {
      data['ability'] = this.ability.toJson();
    }
    data['is_hidden'] = this.isHidden;
    data['slot'] = this.slot;
    return data;
  }
}

class GameIndices {
  int gameIndex;
  CommonResult version;

  GameIndices({this.gameIndex, this.version});

  GameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version = json['version'] != null
        ? new CommonResult.fromJson(json['version'])
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
  CommonResult item;
  List<VersionDetails> versionDetails;

  HeldItems({this.item, this.versionDetails});

  HeldItems.fromJson(Map<String, dynamic> json) {
    item =
        json['item'] != null ? new CommonResult.fromJson(json['item']) : null;
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
  CommonResult version;

  VersionDetails({this.rarity, this.version});

  VersionDetails.fromJson(Map<String, dynamic> json) {
    rarity = json['rarity'];
    version = json['version'] != null
        ? new CommonResult.fromJson(json['version'])
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

class Moves {
  CommonResult move;
  List<VersionGroupDetails> versionGroupDetails;

  Moves({this.move, this.versionGroupDetails});

  Moves.fromJson(Map<String, dynamic> json) {
    move =
        json['move'] != null ? new CommonResult.fromJson(json['move']) : null;
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
  CommonResult moveLearnMethod;
  CommonResult versionGroup;

  VersionGroupDetails(
      {this.levelLearnedAt, this.moveLearnMethod, this.versionGroup});

  VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnMethod = json['move_learn_method'] != null
        ? new CommonResult.fromJson(json['move_learn_method'])
        : null;
    versionGroup = json['version_group'] != null
        ? new CommonResult.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level_learned_at'] = this.levelLearnedAt;
    if (this.moveLearnMethod != null) {
      data['move_learn_method'] = this.moveLearnMethod.toJson();
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup.toJson();
    }
    return data;
  }
}

class Sprites {
  String backDefault;
  String backFemale;
  String backShiny;
  String backShinyFemale;
  String frontDefault;
  String frontFemale;
  String frontShiny;
  String frontShinyFemale;

  Sprites(
      {this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale});

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['back_default'] = this.backDefault;
    data['back_female'] = this.backFemale;
    data['back_shiny'] = this.backShiny;
    data['back_shiny_female'] = this.backShinyFemale;
    data['front_default'] = this.frontDefault;
    data['front_female'] = this.frontFemale;
    data['front_shiny'] = this.frontShiny;
    data['front_shiny_female'] = this.frontShinyFemale;
    return data;
  }
}

class Stats {
  int baseStat;
  int effort;
  CommonResult stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat =
        json['stat'] != null ? new CommonResult.fromJson(json['stat']) : null;
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
  CommonResult type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type =
        json['type'] != null ? new CommonResult.fromJson(json['type']) : null;
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
