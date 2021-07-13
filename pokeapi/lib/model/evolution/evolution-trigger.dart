import 'package:pokeapi/model/utils/common.dart';

class EvolutionTrigger {
  List<EvolutionTriggerName>? names;
  String? name;
  int? id;
  List<NamedAPIResource>? pokemonSpecies;

  EvolutionTrigger({this.names, this.name, this.id, this.pokemonSpecies});

  EvolutionTrigger.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names =  <EvolutionTriggerName>[];
      (json['names'] as List).forEach((v) {
        names!.add( EvolutionTriggerName.fromJson(v));
      });
    }
    name = json['name'];
    id = json['id'];
    if (json['pokemon_species'] != null) {
      pokemonSpecies =  <NamedAPIResource>[];
      (json['pokemon_species'] as List).forEach((v) {
        pokemonSpecies!.add( NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.pokemonSpecies != null) {
      data['pokemon_species'] =
          this.pokemonSpecies!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'EvolutionTrigger{names: $names, name: $name, id: $id, pokemonSpecies: $pokemonSpecies}';
  }
}

class EvolutionTriggerName {
  String? name;
  NamedAPIResource? language;

  EvolutionTriggerName({this.name, this.language});

  EvolutionTriggerName.fromJson(Map<String, dynamic> json) {
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
    return 'EvolutionTriggerName{name: $name, language: $language}';
  }
}
