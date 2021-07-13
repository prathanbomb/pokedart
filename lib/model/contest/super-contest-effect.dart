import 'package:pokeapi/model/utils/common.dart';

class SuperContestEffect {
  List<NamedAPIResource>? moves;
  List<SuperContestEffectFlavorTextEntry>? flavorTextEntries;
  int? appeal;
  int? id;

  SuperContestEffect(
      {this.moves, this.flavorTextEntries, this.appeal, this.id});

  SuperContestEffect.fromJson(Map<String, dynamic> json) {
    if (json['moves'] != null) {
      moves =  <NamedAPIResource>[];
      (json['moves'] as List).forEach((v) {
        moves!.add( NamedAPIResource.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries =  <SuperContestEffectFlavorTextEntry>[ ];
      (json['flavor_text_entries'] as List).forEach((v) {
        flavorTextEntries!
            .add( SuperContestEffectFlavorTextEntry.fromJson(v));
      });
    }
    appeal = json['appeal'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.moves != null) {
      data['moves'] = this.moves!.map((v) => v.toJson()).toList();
    }
    if (this.flavorTextEntries != null) {
      data['flavor_text_entries'] =
          this.flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    data['appeal'] = this.appeal;
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    return 'SuperContestEffect{moves: $moves, flavorTextEntries: $flavorTextEntries, appeal: $appeal, id: $id}';
  }
}

class SuperContestEffectFlavorTextEntry {
  NamedAPIResource? language;
  String? flavorText;

  SuperContestEffectFlavorTextEntry({this.language, this.flavorText});

  SuperContestEffectFlavorTextEntry.fromJson(Map<String, dynamic> json) {
    language = json['language'] != null
        ?  NamedAPIResource.fromJson(json['language'])
        : null;
    flavorText = json['flavor_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    data['flavor_text'] = this.flavorText;
    return data;
  }

  @override
  String toString() {
    return 'SuperContestEffectFlavorTextEntry{language: $language, flavorText: $flavorText}';
  }
}
