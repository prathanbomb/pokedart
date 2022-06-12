import 'package:pokeapi/model/utils/common.dart';

class Ability {
  int? id;
  String? name;
  bool? isMainSeries;
  NamedAPIResource? generation;
  List<Names>? names;
  List<AbilityEffectEntries>? effectEntries;
  List<AbilityEffectChanges>? effectChanges;
  List<AbilityFlavorTextEntries>? flavorTextEntries;
  List<NamedAPIResource>? pokemon;

  Ability(
      {this.id,
      this.name,
      this.isMainSeries,
      this.generation,
      this.names,
      this.effectEntries,
      this.effectChanges,
      this.flavorTextEntries,
      this.pokemon});

  Ability.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isMainSeries = json['is_main_series'];
    generation = json['generation'] != null
        ?  NamedAPIResource.fromJson(json['generation'])
        : null;
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add( Names.fromJson(v));
      });
    }
    if (json['effect_entries'] != null) {
      effectEntries = <AbilityEffectEntries>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add( AbilityEffectEntries.fromJson(v));
      });
    }
    if (json['effect_changes'] != null) {
      effectChanges = <AbilityEffectChanges>[];
      json['effect_changes'].forEach((v) {
        effectChanges!.add( AbilityEffectChanges.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <AbilityFlavorTextEntries>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add( AbilityFlavorTextEntries.fromJson(v));
      });
    }
    if (json['pokemon'] != null) {
      pokemon = <NamedAPIResource>[];
      json['pokemon'].forEach((v) {
        v = v['pokemon'];
        pokemon!.add( NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_main_series'] = this.isMainSeries;
    if (this.generation != null) {
      data['generation'] = this.generation!.toJson();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries!.map((v) => v.toJson()).toList();
    }
    if (this.effectChanges != null) {
      data['effect_changes'] =
          this.effectChanges!.map((v) => v.toJson()).toList();
    }
    if (this.flavorTextEntries != null) {
      data['flavor_text_entries'] =
          this.flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Ability{id: $id, name: $name, isMainSeries: $isMainSeries, generation: $generation, names: $names, effectEntries: $effectEntries, effectChanges: $effectChanges, flavorTextEntries: $flavorTextEntries, pokemon: $pokemon}';
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

class AbilityEffectEntries {
  String? effect;
  String? shortEffect;
  NamedAPIResource? language;

  AbilityEffectEntries({this.effect, this.shortEffect, this.language});

  AbilityEffectEntries.fromJson(Map<String, dynamic> json) {
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
    return 'AbilityEffectEntries{effect: $effect, shortEffect: $shortEffect, language: $language}';
  }
}

class AbilityEffectChanges {
  NamedAPIResource? versionGroup;
  List<AbilityEffectEntries>? effectEntries;

  AbilityEffectChanges({this.versionGroup, this.effectEntries});

  AbilityEffectChanges.fromJson(Map<String, dynamic> json) {
    versionGroup = json['version_group'] != null
        ?  NamedAPIResource.fromJson(json['version_group'])
        : null;
    if (json['effect_entries'] != null) {
      effectEntries =  <AbilityEffectEntries>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add( AbilityEffectEntries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup!.toJson();
    }
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'AbilityEffectChanges{versionGroup: $versionGroup, effectEntries: $effectEntries}';
  }
}

class AbilityFlavorTextEntries {
  String? flavorText;
  NamedAPIResource? language;
  NamedAPIResource? versionGroup;

  AbilityFlavorTextEntries({this.flavorText, this.language, this.versionGroup});

  AbilityFlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language = json['language'] != null
        ?  NamedAPIResource.fromJson(json['language'])
        : null;
    versionGroup = json['version_group'] != null
        ?  NamedAPIResource.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['flavor_text'] = this.flavorText;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'AbilityFlavorTextEntries{flavorText: $flavorText, language: $language, versionGroup: $versionGroup}';
  }
}

class AbilityPokemon {
  bool? isHidden;
  int? slot;
  AbilityPokemon? pokemon;

  AbilityPokemon({this.isHidden, this.slot, this.pokemon});

  AbilityPokemon.fromJson(Map<String, dynamic> json) {
    isHidden = json['is_hidden'];
    slot = json['slot'];
    pokemon = json['pokemon'] != null
        ?  AbilityPokemon.fromJson(json['pokemon'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['is_hidden'] = this.isHidden;
    data['slot'] = this.slot;
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'AbilityPokemon{isHidden: $isHidden, slot: $slot, pokemon: $pokemon}';
  }
}
