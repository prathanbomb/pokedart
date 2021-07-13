import 'package:pokeapi/model/utils/common.dart';

class Nature {
  int? id;
  String? name;
  NamedAPIResource? decreasedStat;
  NamedAPIResource? increasedStat;
  NamedAPIResource? likesFlavor;
  NamedAPIResource? hatesFlavor;
  List<PokeathlonStatChanges>? pokeathlonStatChanges;
  List<MoveBattleStylePreferences>? moveBattleStylePreferences;
  List<Names>? names;

  Nature(
      {this.id,
      this.name,
      this.decreasedStat,
      this.increasedStat,
      this.likesFlavor,
      this.hatesFlavor,
      this.pokeathlonStatChanges,
      this.moveBattleStylePreferences,
      this.names});

  Nature.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    decreasedStat = json['decreased_stat'] != null
        ?  NamedAPIResource.fromJson(json['decreased_stat'])
        : null;
    increasedStat = json['increased_stat'] != null
        ?  NamedAPIResource.fromJson(json['increased_stat'])
        : null;
    likesFlavor = json['likes_flavor'] != null
        ?  NamedAPIResource.fromJson(json['likes_flavor'])
        : null;
    hatesFlavor = json['hates_flavor'] != null
        ?  NamedAPIResource.fromJson(json['hates_flavor'])
        : null;
    if (json['pokeathlon_stat_changes'] != null) {
      pokeathlonStatChanges =  <PokeathlonStatChanges>[];
      json['pokeathlon_stat_changes'].forEach((v) {
        pokeathlonStatChanges!.add( PokeathlonStatChanges.fromJson(v));
      });
    }
    if (json['move_battle_style_preferences'] != null) {
      moveBattleStylePreferences =  <MoveBattleStylePreferences>[];
      json['move_battle_style_preferences'].forEach((v) {
        moveBattleStylePreferences!
            .add( MoveBattleStylePreferences.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names =  <Names>[];
      json['names'].forEach((v) {
        names!.add( Names.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.decreasedStat != null) {
      data['decreased_stat'] = this.decreasedStat!.toJson();
    }
    if (this.increasedStat != null) {
      data['increased_stat'] = this.increasedStat!.toJson();
    }
    if (this.likesFlavor != null) {
      data['likes_flavor'] = this.likesFlavor!.toJson();
    }
    if (this.hatesFlavor != null) {
      data['hates_flavor'] = this.hatesFlavor!.toJson();
    }
    if (this.pokeathlonStatChanges != null) {
      data['pokeathlon_stat_changes'] =
          this.pokeathlonStatChanges!.map((v) => v.toJson()).toList();
    }
    if (this.moveBattleStylePreferences != null) {
      data['move_battle_style_preferences'] =
          this.moveBattleStylePreferences!.map((v) => v.toJson()).toList();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Nature{id: $id, name: $name, decreasedStat: $decreasedStat, increasedStat: $increasedStat, likesFlavor: $likesFlavor, hatesFlavor: $hatesFlavor, pokeathlonStatChanges: $pokeathlonStatChanges, moveBattleStylePreferences: $moveBattleStylePreferences, names: $names}';
  }
}

class PokeathlonStatChanges {
  int? maxChange;
  NamedAPIResource? pokeathlonStat;

  PokeathlonStatChanges({this.maxChange, this.pokeathlonStat});

  PokeathlonStatChanges.fromJson(Map<String, dynamic> json) {
    maxChange = json['max_change'];
    pokeathlonStat = json['pokeathlon_stat'] != null
        ?  NamedAPIResource.fromJson(json['pokeathlon_stat'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['max_change'] = this.maxChange;
    if (this.pokeathlonStat != null) {
      data['pokeathlon_stat'] = this.pokeathlonStat!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokeathlonStatChanges{maxChange: $maxChange, pokeathlonStat: $pokeathlonStat}';
  }
}

class MoveBattleStylePreferences {
  int? lowHpPreference;
  int? highHpPreference;
  NamedAPIResource? moveBattleStyle;

  MoveBattleStylePreferences(
      {this.lowHpPreference, this.highHpPreference, this.moveBattleStyle});

  MoveBattleStylePreferences.fromJson(Map<String, dynamic> json) {
    lowHpPreference = json['low_hp_preference'];
    highHpPreference = json['high_hp_preference'];
    moveBattleStyle = json['move_battle_style'] != null
        ?  NamedAPIResource.fromJson(json['move_battle_style'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['low_hp_preference'] = this.lowHpPreference;
    data['high_hp_preference'] = this.highHpPreference;
    if (this.moveBattleStyle != null) {
      data['move_battle_style'] = this.moveBattleStyle!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'MoveBattleStylePreferences{lowHpPreference: $lowHpPreference, highHpPreference: $highHpPreference, moveBattleStyle: $moveBattleStyle}';
  }
}

class Names {
  String? name;
  NamedAPIResource? language;

  Names({this.name, this.language});

  Names.fromJson(Map<String, dynamic> json) {
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
    return 'Names{name: $name, language: $language}';
  }
}
