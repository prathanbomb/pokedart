import 'package:pokeapi/model/utils/common.dart';

class LocationArea {
  int? gameIndex;
  List<LocationAreaName>? names;
  List<LocationAreaPokemonEncounter>? pokemonEncounters;
  String? name;
  NamedAPIResource? location;
  int? id;
  List<LocationAreaEncounterMethodRate>? encounterMethodRates;

  LocationArea(
      {this.gameIndex,
      this.names,
      this.pokemonEncounters,
      this.name,
      this.location,
      this.id,
      this.encounterMethodRates});

  LocationArea.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    if (json['names'] != null) {
      names = <LocationAreaName>[];
      (json['names'] as List).forEach((v) {
        names!.add(LocationAreaName.fromJson(v));
      });
    }
    if (json['pokemon_encounters'] != null) {
      pokemonEncounters = <LocationAreaPokemonEncounter>[];
      (json['pokemon_encounters'] as List).forEach((v) {
        pokemonEncounters!.add(LocationAreaPokemonEncounter.fromJson(v));
      });
    }
    name = json['name'];
    location = json['location'] != null
        ? NamedAPIResource.fromJson(json['location'])
        : null;
    id = json['id'];
    if (json['encounter_method_rates'] != null) {
      encounterMethodRates = <LocationAreaEncounterMethodRate>[];
      (json['encounter_method_rates'] as List).forEach((v) {
        encounterMethodRates!.add(LocationAreaEncounterMethodRate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['game_index'] = this.gameIndex;
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    if (this.pokemonEncounters != null) {
      data['pokemon_encounters'] =
          this.pokemonEncounters!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['id'] = this.id;
    if (this.encounterMethodRates != null) {
      data['encounter_method_rates'] =
          this.encounterMethodRates!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'LocationArea{gameIndex: $gameIndex, names: $names, pokemonEncounters: $pokemonEncounters, name: $name, location: $location, id: $id, encounterMethodRates: $encounterMethodRates}';
  }
}

class LocationAreaName {
  String? name;
  NamedAPIResource? language;

  LocationAreaName({this.name, this.language});

  LocationAreaName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'] != null
        ? NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'LocationAreaName{name: $name, language: $language}';
  }
}

class LocationAreaPokemonEncounter {
  NamedAPIResource? pokemon;
  List<LocationAreaPokemonEncountersVersionDetail>? versionDetails;

  LocationAreaPokemonEncounter({this.pokemon, this.versionDetails});

  LocationAreaPokemonEncounter.fromJson(Map<String, dynamic> json) {
    pokemon = json['pokemon'] != null
        ? NamedAPIResource.fromJson(json['pokemon'])
        : null;
    if (json['version_details'] != null) {
      versionDetails = <LocationAreaPokemonEncountersVersionDetail>[];
      (json['version_details'] as List).forEach((v) {
        versionDetails!
            .add(LocationAreaPokemonEncountersVersionDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon!.toJson();
    }
    if (this.versionDetails != null) {
      data['version_details'] =
          this.versionDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'LocationAreaPokemonEncounter{pokemon: $pokemon, versionDetails: $versionDetails}';
  }
}

class LocationAreaPokemonEncountersVersionDetail {
  int? maxChance;
  List<LocationAreaPokemonEncountersVersionDetailsEncounterDetail>?
      encounterDetails;
  NamedAPIResource? version;

  LocationAreaPokemonEncountersVersionDetail(
      {this.maxChance, this.encounterDetails, this.version});

  LocationAreaPokemonEncountersVersionDetail.fromJson(
      Map<String, dynamic> json) {
    maxChance = json['max_chance'];
    if (json['encounter_details'] != null) {
      encounterDetails =
          <LocationAreaPokemonEncountersVersionDetailsEncounterDetail>[];
      (json['encounter_details'] as List).forEach((v) {
        encounterDetails!.add(
            LocationAreaPokemonEncountersVersionDetailsEncounterDetail.fromJson(
                v));
      });
    }
    version = json['version'] != null
        ? NamedAPIResource.fromJson(json['version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['max_chance'] = this.maxChance;
    if (this.encounterDetails != null) {
      data['encounter_details'] =
          this.encounterDetails!.map((v) => v.toJson()).toList();
    }
    if (this.version != null) {
      data['version'] = this.version!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'LocationAreaPokemonEncountersVersionDetail{maxChance: $maxChance, encounterDetails: $encounterDetails, version: $version}';
  }
}

class LocationAreaPokemonEncountersVersionDetailsEncounterDetail {
  List<NamedAPIResource>? conditionValues;
  int? chance;
  NamedAPIResource? method;
  int? maxLevel;
  int? minLevel;

  LocationAreaPokemonEncountersVersionDetailsEncounterDetail(
      {this.conditionValues,
      this.chance,
      this.method,
      this.maxLevel,
      this.minLevel});

  LocationAreaPokemonEncountersVersionDetailsEncounterDetail.fromJson(
      Map<String, dynamic> json) {
    if (json['condition_values'] != null) {
      conditionValues = <NamedAPIResource>[];
    }
    chance = json['chance'];
    method = json['method'] != null
        ? NamedAPIResource.fromJson(json['method'])
        : null;
    maxLevel = json['max_level'];
    minLevel = json['min_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.conditionValues != null) {
      data['condition_values'] = [];
    }
    data['chance'] = this.chance;
    if (this.method != null) {
      data['method'] = this.method!.toJson();
    }
    data['max_level'] = this.maxLevel;
    data['min_level'] = this.minLevel;
    return data;
  }

  @override
  String toString() {
    return 'LocationAreaPokemonEncountersVersionDetailsEncounterDetail{conditionValues: $conditionValues, chance: $chance, method: $method, maxLevel: $maxLevel, minLevel: $minLevel}';
  }
}

class LocationAreaEncounterMethodRate {
  List<LocationAreaEncounterMethodRatesVersionDetail>? versionDetails;
  NamedAPIResource? encounterMethod;

  LocationAreaEncounterMethodRate({this.versionDetails, this.encounterMethod});

  LocationAreaEncounterMethodRate.fromJson(Map<String, dynamic> json) {
    if (json['version_details'] != null) {
      versionDetails = <LocationAreaEncounterMethodRatesVersionDetail>[];
      (json['version_details'] as List).forEach((v) {
        versionDetails!
            .add(LocationAreaEncounterMethodRatesVersionDetail.fromJson(v));
      });
    }
    encounterMethod = json['encounter_method'] != null
        ? NamedAPIResource.fromJson(json['encounter_method'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.versionDetails != null) {
      data['version_details'] =
          this.versionDetails!.map((v) => v.toJson()).toList();
    }
    if (this.encounterMethod != null) {
      data['encounter_method'] = this.encounterMethod!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'LocationAreaEncounterMethodRate{versionDetails: $versionDetails, encounterMethod: $encounterMethod}';
  }
}

class LocationAreaEncounterMethodRatesVersionDetail {
  int? rate;
  NamedAPIResource? version;

  LocationAreaEncounterMethodRatesVersionDetail({this.rate, this.version});

  LocationAreaEncounterMethodRatesVersionDetail.fromJson(
      Map<String, dynamic> json) {
    rate = json['rate'];
    version = json['version'] != null
        ? NamedAPIResource.fromJson(json['version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['rate'] = this.rate;
    if (this.version != null) {
      data['version'] = this.version!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'LocationAreaEncounterMethodRatesVersionDetail{rate: $rate, version: $version}';
  }
}
