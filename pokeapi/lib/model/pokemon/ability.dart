import 'package:pokeapi/model/utils/common.dart';

class Ability {
  int id;
  String name;
  bool isMainSeries;
  NamedAPIResource generation;
  List<Names> names;
  List<EffectEntries> effectEntries;
  List<EffectChanges> effectChanges;
  List<FlavorTextEntries> flavorTextEntries;
  List<NamedAPIResource> pokemon;

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
        ? new NamedAPIResource.fromJson(json['generation'])
        : null;
    if (json['names'] != null) {
      names = new List<Names>();
      json['names'].forEach((v) {
        names.add(new Names.fromJson(v));
      });
    }
    if (json['effect_entries'] != null) {
      effectEntries = new List<EffectEntries>();
      json['effect_entries'].forEach((v) {
        effectEntries.add(new EffectEntries.fromJson(v));
      });
    }
    if (json['effect_changes'] != null) {
      effectChanges = new List<EffectChanges>();
      json['effect_changes'].forEach((v) {
        effectChanges.add(new EffectChanges.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = new List<FlavorTextEntries>();
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries.add(new FlavorTextEntries.fromJson(v));
      });
    }
    if (json['pokemon'] != null) {
      pokemon = new List<NamedAPIResource>();
      json['pokemon'].forEach((v) {
        pokemon.add(new NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_main_series'] = this.isMainSeries;
    if (this.generation != null) {
      data['generation'] = this.generation.toJson();
    }
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries.map((v) => v.toJson()).toList();
    }
    if (this.effectChanges != null) {
      data['effect_changes'] =
          this.effectChanges.map((v) => v.toJson()).toList();
    }
    if (this.flavorTextEntries != null) {
      data['flavor_text_entries'] =
          this.flavorTextEntries.map((v) => v.toJson()).toList();
    }
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Names {
  String name;
  NamedAPIResource language;

  Names({this.name, this.language});

  Names.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'] != null
        ? new NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    return data;
  }
}

class EffectEntries {
  String effect;
  String shortEffect;
  NamedAPIResource language;

  EffectEntries({this.effect, this.shortEffect, this.language});

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    shortEffect = json['short_effect'];
    language = json['language'] != null
        ? new NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['effect'] = this.effect;
    data['short_effect'] = this.shortEffect;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    return data;
  }
}

class EffectChanges {
  NamedAPIResource versionGroup;
  List<EffectEntries> effectEntries;

  EffectChanges({this.versionGroup, this.effectEntries});

  EffectChanges.fromJson(Map<String, dynamic> json) {
    versionGroup = json['version_group'] != null
        ? new NamedAPIResource.fromJson(json['version_group'])
        : null;
    if (json['effect_entries'] != null) {
      effectEntries = new List<EffectEntries>();
      json['effect_entries'].forEach((v) {
        effectEntries.add(new EffectEntries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup.toJson();
    }
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FlavorTextEntries {
  String flavorText;
  NamedAPIResource language;
  NamedAPIResource versionGroup;

  FlavorTextEntries({this.flavorText, this.language, this.versionGroup});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language = json['language'] != null
        ? new NamedAPIResource.fromJson(json['language'])
        : null;
    versionGroup = json['version_group'] != null
        ? new NamedAPIResource.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flavor_text'] = this.flavorText;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup.toJson();
    }
    return data;
  }
}

class Pokemon {
  bool isHidden;
  int slot;
  Pokemon pokemon;

  Pokemon({this.isHidden, this.slot, this.pokemon});

  Pokemon.fromJson(Map<String, dynamic> json) {
    isHidden = json['is_hidden'];
    slot = json['slot'];
    pokemon =
        json['pokemon'] != null ? new Pokemon.fromJson(json['pokemon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_hidden'] = this.isHidden;
    data['slot'] = this.slot;
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.toJson();
    }
    return data;
  }
}
