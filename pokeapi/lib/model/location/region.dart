import 'package:pokeapi/model/utils/common.dart';

class Region {
  NamedAPIResource mainGeneration;
  List<RegionName> names;
  List<NamedAPIResource> pokedexes;
  List<NamedAPIResource> versionGroups;
  String name;
  List<NamedAPIResource> locations;
  int id;

  Region(
      {this.mainGeneration,
      this.names,
      this.pokedexes,
      this.versionGroups,
      this.name,
      this.locations,
      this.id});

  Region.fromJson(Map<String, dynamic> json) {
    mainGeneration = json['main_generation'] != null
        ? new NamedAPIResource.fromJson(json['main_generation'])
        : null;
    if (json['names'] != null) {
      names = new List<RegionName>();
      (json['names'] as List).forEach((v) {
        names.add(new RegionName.fromJson(v));
      });
    }
    if (json['pokedexes'] != null) {
      pokedexes = new List<NamedAPIResource>();
      (json['pokedexes'] as List).forEach((v) {
        pokedexes.add(new NamedAPIResource.fromJson(v));
      });
    }
    if (json['version_groups'] != null) {
      versionGroups = new List<NamedAPIResource>();
      (json['version_groups'] as List).forEach((v) {
        versionGroups.add(new NamedAPIResource.fromJson(v));
      });
    }
    name = json['name'];
    if (json['locations'] != null) {
      locations = new List<NamedAPIResource>();
      (json['locations'] as List).forEach((v) {
        locations.add(new NamedAPIResource.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainGeneration != null) {
      data['main_generation'] = this.mainGeneration.toJson();
    }
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    if (this.pokedexes != null) {
      data['pokedexes'] = this.pokedexes.map((v) => v.toJson()).toList();
    }
    if (this.versionGroups != null) {
      data['version_groups'] =
          this.versionGroups.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    if (this.locations != null) {
      data['locations'] = this.locations.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    return 'Region{mainGeneration: $mainGeneration, names: $names, pokedexes: $pokedexes, versionGroups: $versionGroups, name: $name, locations: $locations, id: $id}';
  }
}

class RegionName {
  String name;
  NamedAPIResource language;

  RegionName({this.name, this.language});

  RegionName.fromJson(Map<String, dynamic> json) {
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
    return 'RegionName{name: $name, language: $language}';
  }
}
