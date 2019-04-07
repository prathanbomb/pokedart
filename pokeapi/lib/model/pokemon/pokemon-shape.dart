import 'package:pokeapi/model/utils/common.dart';

class PokemonShape {
  int id;
  String name;
  List<AwesomeNames> awesomeNames;
  List<Names> names;
  List<NamedAPIResource> pokemonSpecies;

  PokemonShape(
      {this.id, this.name, this.awesomeNames, this.names, this.pokemonSpecies});

  PokemonShape.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['awesome_names'] != null) {
      awesomeNames = new List<AwesomeNames>();
      json['awesome_names'].forEach((v) {
        awesomeNames.add(new AwesomeNames.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = new List<Names>();
      json['names'].forEach((v) {
        names.add(new Names.fromJson(v));
      });
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = new List<NamedAPIResource>();
      json['pokemon_species'].forEach((v) {
        pokemonSpecies.add(new NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.awesomeNames != null) {
      data['awesome_names'] = this.awesomeNames.map((v) => v.toJson()).toList();
    }
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    if (this.pokemonSpecies != null) {
      data['pokemon_species'] =
          this.pokemonSpecies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AwesomeNames {
  String awesomeName;
  NamedAPIResource language;

  AwesomeNames({this.awesomeName, this.language});

  AwesomeNames.fromJson(Map<String, dynamic> json) {
    awesomeName = json['awesome_name'];
    language = json['language'] != null
        ? new NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['awesome_name'] = this.awesomeName;
    if (this.language != null) {
      data['language'] = this.language.toJson();
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
