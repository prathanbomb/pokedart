import 'package:pokeapi/model/utils/common.dart';

class PalParkArea {
  List<PalParkAreaName>? names;
  List<PalParkAreaPokemonEncounter>? pokemonEncounters;
  String? name;
  int? id;

  PalParkArea({this.names, this.pokemonEncounters, this.name, this.id});

  PalParkArea.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names =  <PalParkAreaName>[];
      (json['names'] as List).forEach((v) {
        names!.add( PalParkAreaName.fromJson(v));
      });
    }
    if (json['pokemon_encounters'] != null) {
      pokemonEncounters =  <PalParkAreaPokemonEncounter>[];
      (json['pokemon_encounters'] as List).forEach((v) {
        pokemonEncounters!.add( PalParkAreaPokemonEncounter.fromJson(v));
      });
    }
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    if (this.pokemonEncounters != null) {
      data['pokemon_encounters'] =
          this.pokemonEncounters!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    return 'PalParkArea{names: $names, pokemonEncounters: $pokemonEncounters, name: $name, id: $id}';
  }
}

class PalParkAreaName {
  String? name;
  NamedAPIResource? language;

  PalParkAreaName({this.name, this.language});

  PalParkAreaName.fromJson(Map<String, dynamic> json) {
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
    return 'PalParkAreaName{name: $name, language: $language}';
  }
}

class PalParkAreaPokemonEncounter {
  int? baseScore;
  int? rate;
  NamedAPIResource? pokemonSpecies;

  PalParkAreaPokemonEncounter({this.baseScore, this.rate, this.pokemonSpecies});

  PalParkAreaPokemonEncounter.fromJson(Map<String, dynamic> json) {
    baseScore = json['base_score'];
    rate = json['rate'];
    pokemonSpecies = json['pokemon_species'] != null
        ?  NamedAPIResource.fromJson(json['pokemon_species'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['base_score'] = this.baseScore;
    data['rate'] = this.rate;
    if (this.pokemonSpecies != null) {
      data['pokemon_species'] = this.pokemonSpecies!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PalParkAreaPokemonEncounter{baseScore: $baseScore, rate: $rate, pokemonSpecies: $pokemonSpecies}';
  }
}
