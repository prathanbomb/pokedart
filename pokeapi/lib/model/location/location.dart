import 'package:pokeapi/model/utils/common.dart';

class Location {
  List<LocationGameIndex>? gameIndices;
  List<LocationName>? names;
  String? name;
  List<NamedAPIResource>? areas;
  int? id;
  NamedAPIResource? region;

  Location(
      {this.gameIndices,
      this.names,
      this.name,
      this.areas,
      this.id,
      this.region});

  Location.fromJson(Map<String, dynamic> json) {
    if (json['game_indices'] != null) {
      gameIndices =  <LocationGameIndex>[];
      (json['game_indices'] as List).forEach((v) {
        gameIndices!.add( LocationGameIndex.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names =  <LocationName>[];
      (json['names'] as List).forEach((v) {
        names!.add( LocationName.fromJson(v));
      });
    }
    name = json['name'];
    if (json['areas'] != null) {
      areas =  <NamedAPIResource>[];
      (json['areas'] as List).forEach((v) {
        areas!.add( NamedAPIResource.fromJson(v));
      });
    }
    id = json['id'];
    region = json['region'] != null
        ?  NamedAPIResource.fromJson(json['region'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.gameIndices != null) {
      data['game_indices'] = this.gameIndices!.map((v) => v.toJson()).toList();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    if (this.areas != null) {
      data['areas'] = this.areas!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Location{gameIndices: $gameIndices, names: $names, name: $name, areas: $areas, id: $id, region: $region}';
  }
}

class LocationGameIndex {
  NamedAPIResource? generation;
  int? gameIndex;

  LocationGameIndex({this.generation, this.gameIndex});

  LocationGameIndex.fromJson(Map<String, dynamic> json) {
    generation = json['generation'] != null
        ?  NamedAPIResource.fromJson(json['generation'])
        : null;
    gameIndex = json['game_index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.generation != null) {
      data['generation'] = this.generation!.toJson();
    }
    data['game_index'] = this.gameIndex;
    return data;
  }

  @override
  String toString() {
    return 'LocationGameIndex{generation: $generation, gameIndex: $gameIndex}';
  }
}

class LocationName {
  String? name;
  NamedAPIResource? language;

  LocationName({this.name, this.language});

  LocationName.fromJson(Map<String, dynamic> json) {
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
    return 'LocationName{name: $name, language: $language}';
  }
}
