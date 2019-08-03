import 'package:pokeapi/model/utils/common.dart';

class Generation {
  List<NamedAPIResource> abilities;
  List<NamedAPIResource> types;
  List<GenerationName> names;
  NamedAPIResource mainRegion;
  List<NamedAPIResource> versionGroups;
  List<NamedAPIResource> moves;
  String name;
  int id;
  List<NamedAPIResource> pokemonSpecies;

  Generation(
      {this.abilities,
      this.types,
      this.names,
      this.mainRegion,
      this.versionGroups,
      this.moves,
      this.name,
      this.id,
      this.pokemonSpecies});

  Generation.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = new List<Null>();
    }
    if (json['types'] != null) {
      types = new List<NamedAPIResource>();
      (json['types'] as List).forEach((v) {
        types.add(new NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = new List<GenerationName>();
      (json['names'] as List).forEach((v) {
        names.add(new GenerationName.fromJson(v));
      });
    }
    mainRegion = json['main_region'] != null
        ? new NamedAPIResource.fromJson(json['main_region'])
        : null;
    if (json['version_groups'] != null) {
      versionGroups = new List<NamedAPIResource>();
      (json['version_groups'] as List).forEach((v) {
        versionGroups.add(new NamedAPIResource.fromJson(v));
      });
    }
    if (json['moves'] != null) {
      moves = new List<NamedAPIResource>();
      (json['moves'] as List).forEach((v) {
        moves.add(new NamedAPIResource.fromJson(v));
      });
    }
    name = json['name'];
    id = json['id'];
    if (json['pokemon_species'] != null) {
      pokemonSpecies = new List<NamedAPIResource>();
      (json['pokemon_species'] as List).forEach((v) {
        pokemonSpecies.add(new NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abilities != null) {
      data['abilities'] = [];
    }
    if (this.types != null) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    if (this.mainRegion != null) {
      data['main_region'] = this.mainRegion.toJson();
    }
    if (this.versionGroups != null) {
      data['version_groups'] =
          this.versionGroups.map((v) => v.toJson()).toList();
    }
    if (this.moves != null) {
      data['moves'] = this.moves.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.pokemonSpecies != null) {
      data['pokemon_species'] =
          this.pokemonSpecies.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Generation{abilities: $abilities, types: $types, names: $names, mainRegion: $mainRegion, versionGroups: $versionGroups, moves: $moves, name: $name, id: $id, pokemonSpecies: $pokemonSpecies}';
  }
}

class GenerationName {
  String name;
  NamedAPIResource language;

  GenerationName({this.name, this.language});

  GenerationName.fromJson(Map<String, dynamic> json) {
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

  @override
  String toString() {
    return 'GenerationName{name: $name, language: $language}';
  }
}
