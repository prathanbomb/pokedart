import 'package:pokeapi/model/utils/common.dart';

class ContestEffect {
  List<ContestEffectEffectEntry>? effectEntries;
  List<ContestEffectFlavorTextEntry>? flavorTextEntries;
  int? jam;
  int? appeal;
  int? id;

  ContestEffect(
      {this.effectEntries,
      this.flavorTextEntries,
      this.jam,
      this.appeal,
      this.id});

  ContestEffect.fromJson(Map<String, dynamic> json) {
    if (json['effect_entries'] != null) {
      effectEntries =  <ContestEffectEffectEntry>[];
      (json['effect_entries'] as List).forEach((v) {
        effectEntries!.add( ContestEffectEffectEntry.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries =  <ContestEffectFlavorTextEntry>[];
      (json['flavor_text_entries'] as List).forEach((v) {
        flavorTextEntries!.add( ContestEffectFlavorTextEntry.fromJson(v));
      });
    }
    jam = json['jam'];
    appeal = json['appeal'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries!.map((v) => v.toJson()).toList();
    }
    if (this.flavorTextEntries != null) {
      data['flavor_text_entries'] =
          this.flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    data['jam'] = this.jam;
    data['appeal'] = this.appeal;
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    return 'ContestEffect{effectEntries: $effectEntries, flavorTextEntries: $flavorTextEntries, jam: $jam, appeal: $appeal, id: $id}';
  }
}

class ContestEffectEffectEntry {
  String? effect;
  NamedAPIResource? language;

  ContestEffectEffectEntry({this.effect, this.language});

  ContestEffectEffectEntry.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = json['language'] != null
        ?  NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['effect'] = this.effect;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ContestEffectEffectEntry{effect: $effect, language: $language}';
  }
}

class ContestEffectFlavorTextEntry {
  NamedAPIResource? language;
  String? flavorText;

  ContestEffectFlavorTextEntry({this.language, this.flavorText});

  ContestEffectFlavorTextEntry.fromJson(Map<String, dynamic> json) {
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
    return 'ContestEffectFlavorTextEntry{language: $language, flavorText: $flavorText}';
  }
}
