import 'package:pokeapi/model/utils/common.dart';

class Pokedex {
  bool? isMainSeries;
  List<PokedexPokemonEntry>? pokemonEntries;
  List<PokedexName>? names;
  List<NamedAPIResource>? versionGroups;
  String? name;
  int? id;
  dynamic region;
  List<PokedexDescription>? descriptions;

  Pokedex(
      {this.isMainSeries,
      this.pokemonEntries,
      this.names,
      this.versionGroups,
      this.name,
      this.id,
      this.region,
      this.descriptions});

  Pokedex.fromJson(Map<String, dynamic> json) {
    isMainSeries = json['is_main_series'];
    if (json['pokemon_entries'] != null) {
      pokemonEntries = <PokedexPokemonEntry>[];
      (json['pokemon_entries'] as List).forEach((v) {
        pokemonEntries!.add(new PokedexPokemonEntry.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <PokedexName>[];
      (json['names'] as List).forEach((v) {
        names!.add(new PokedexName.fromJson(v));
      });
    }
    if (json['version_groups'] != null) {
      versionGroups = <Null>[] as List<NamedAPIResource>;
    }
    name = json['name'];
    id = json['id'];
    region = json['region'];
    if (json['descriptions'] != null) {
      descriptions = <PokedexDescription>[];
      (json['descriptions'] as List).forEach((v) {
        descriptions!.add(new PokedexDescription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_main_series'] = this.isMainSeries;
    if (this.pokemonEntries != null) {
      data['pokemon_entries'] =
          this.pokemonEntries!.map((v) => v.toJson()).toList();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    if (this.versionGroups != null) {
      data['version_groups'] = [];
    }
    data['name'] = this.name;
    data['id'] = this.id;
    data['region'] = this.region;
    if (this.descriptions != null) {
      data['descriptions'] = this.descriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Pokedex{isMainSeries: $isMainSeries, pokemonEntries: $pokemonEntries, names: $names, versionGroups: $versionGroups, name: $name, id: $id, region: $region, descriptions: $descriptions}';
  }
}

class PokedexPokemonEntry {
  int? entryNumber;
  NamedAPIResource? pokemonSpecies;

  PokedexPokemonEntry({this.entryNumber, this.pokemonSpecies});

  PokedexPokemonEntry.fromJson(Map<String, dynamic> json) {
    entryNumber = json['entry_number'];
    pokemonSpecies = json['pokemon_species'] != null
        ? new NamedAPIResource.fromJson(json['pokemon_species'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entry_number'] = this.entryNumber;
    if (this.pokemonSpecies != null) {
      data['pokemon_species'] = this.pokemonSpecies!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokedexPokemonEntry{entryNumber: $entryNumber, pokemonSpecies: $pokemonSpecies}';
  }
}

class PokedexName {
  String? name;
  NamedAPIResource? language;

  PokedexName({this.name, this.language});

  PokedexName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'] != null
        ? new NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokedexName{name: $name, language: $language}';
  }
}

class PokedexDescription {
  String? description;
  NamedAPIResource? language;

  PokedexDescription({this.description, this.language});

  PokedexDescription.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    language = json['language'] != null
        ? new NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokedexDescription{description: $description, language: $language}';
  }
}
