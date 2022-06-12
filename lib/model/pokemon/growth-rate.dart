import 'package:pokeapi/model/utils/common.dart';

class GrowthRate {
  int? id;
  String? name;
  String? formula;
  List<Descriptions>? descriptions;
  List<Levels>? levels;
  List<NamedAPIResource>? pokemonSpecies;

  GrowthRate(
      {this.id,
      this.name,
      this.formula,
      this.descriptions,
      this.levels,
      this.pokemonSpecies});

  GrowthRate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    formula = json['formula'];
    if (json['descriptions'] != null) {
      descriptions =  <Descriptions>[];
      json['descriptions'].forEach((v) {
        descriptions!.add( Descriptions.fromJson(v));
      });
    }
    if (json['levels'] != null) {
      levels =  <Levels>[];
      json['levels'].forEach((v) {
        levels!.add( Levels.fromJson(v));
      });
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies =  <NamedAPIResource>[];
      json['pokemon_species'].forEach((v) {
        pokemonSpecies!.add( NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['formula'] = this.formula;
    if (this.descriptions != null) {
      data['descriptions'] = this.descriptions!.map((v) => v.toJson()).toList();
    }
    if (this.levels != null) {
      data['levels'] = this.levels!.map((v) => v.toJson()).toList();
    }
    if (this.pokemonSpecies != null) {
      data['pokemon_species'] =
          this.pokemonSpecies!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'GrowthRate{id: $id, name: $name, formula: $formula, descriptions: $descriptions, levels: $levels, pokemonSpecies: $pokemonSpecies}';
  }
}

class Descriptions {
  String? description;
  NamedAPIResource? language;

  Descriptions({this.description, this.language});

  Descriptions.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    language = json['language'] != null
        ?  NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['description'] = this.description;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Descriptions{description: $description, language: $language}';
  }
}

class Levels {
  int? level;
  int? experience;

  Levels({this.level, this.experience});

  Levels.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    experience = json['experience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['level'] = this.level;
    data['experience'] = this.experience;
    return data;
  }

  @override
  String toString() {
    return 'Levels{level: $level, experience: $experience}';
  }
}
